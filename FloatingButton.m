#import <notify.h>
#import "FloatingButton.h"
#import "PrivateHeaders.h"
#import "CustomToastView.h"
#import <AVFoundation/AVFoundation.h>

static void vibrateDevice() {
	UIImpactFeedbackGenerator *feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];
	[feedback prepare];
	[feedback impactOccurred];
}

@interface FloatingButton ()
@property (nonatomic, strong) UIButton *floatingButton;
@property (nonatomic, assign) BOOL isImmortalized;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer; /* dirty trick to stop apps from being killed */
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation FloatingButton
+ (instancetype)sharedInstance {
    static FloatingButton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FloatingButton alloc] init];
    });
    return sharedInstance;
}

- (void)showFloatingButtonOnWindow:(UIWindow *)window {
    self.floatingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.floatingButton.frame = CGRectMake(100, 100, 40, 40);

    self.isImmortalized = [[NSUserDefaults standardUserDefaults] boolForKey:@"immortalized"];

    [self updateButtonColor];

    self.floatingButton.layer.cornerRadius = 20;

    UIImage *symbolImage = [UIImage systemImageNamed:@"hourglass.tophalf.fill"]; 
    [self.floatingButton setImage:symbolImage forState:UIControlStateNormal];
    
    self.floatingButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0); 
    [self.floatingButton setTintColor:[UIColor whiteColor]]; 
    [self.floatingButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.floatingButton addGestureRecognizer:panGesture];
    
    [window addSubview:self.floatingButton];
    [self showToast];
}

- (void)buttonTapped:(UIButton *)sender {
	vibrateDevice();
    [[NSUserDefaults standardUserDefaults] setBool:!self.isImmortalized forKey:@"immortalized"];
    self.isImmortalized = !self.isImmortalized;
    notify_post("com.sergy.immortalizerjailed.updateprefs");
    [self updateButtonColor];
    [self showToast];

}

- (void)showToast {
    NSString *subtitle = @"";
    NSString *icon = @"";
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];

    if (self.isImmortalized) {
        subtitle = @"Immortalized";
        icon = @"hourglass.bottomhalf.fill";
        [self startTimer];
    } else {
        subtitle = @"At Rest";
        icon = @"arrow.uturn.left.circle.fill";
        [self stopTimer];
    }

    CustomToastView *toastView = [[CustomToastView alloc] initWithTitle:appName subtitle:subtitle 
                                    icon:[UIImage systemImageNamed:icon] autoHide:3.0];

    [toastView presentToast];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    UIButton *button = (UIButton *)gesture.view;
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:button.superview];
        CGPoint newCenter = CGPointMake(button.center.x + translation.x, button.center.y + translation.y);
        
        CGFloat halfWidth = button.bounds.size.width / 2;
        CGFloat halfHeight = button.bounds.size.height / 2;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        newCenter.x = MAX(halfWidth, MIN(screenWidth - halfWidth, newCenter.x));
        newCenter.y = MAX(halfHeight, MIN(screenHeight - halfHeight, newCenter.y));
        
        button.center = newCenter;
        [gesture setTranslation:CGPointZero inView:button.superview];
    }
}

- (void)updateButtonColor {
    if (self.isImmortalized) {
        self.floatingButton.backgroundColor = [UIColor blueColor];
    } else {
        self.floatingButton.backgroundColor = [UIColor redColor];
    }
}

/* dirty trick to stop apps from being killed, don't judge me */
/* you may wonder why tf i need a timer that keeps calling the play method. */
/* well, there are apps that may play audio, and sometimes it can interfere with the playback of this white noise audio were playing here */
/* unless you can suggest a better way. yes i am lazy lol if it works it works /s */

- (void)startPlayingSilentAudio {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];


    NSData *audioData = [[NSData alloc] initWithBase64EncodedString:kBase64Audio options:NSDataBase64DecodingIgnoreUnknownCharacters];

    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:nil];
    self.audioPlayer.volume = 0.0; /* no sound should be made */
    [self.audioPlayer prepareToPlay];
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
}

- (void)stopPlayingSilentAudio {
    [self.audioPlayer stop];
    [[AVAudioSession sharedInstance] setActive:NO error:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)startTimer {
    [self.timer invalidate];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timerFired)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopTimer {
    [self stopPlayingSilentAudio];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timerFired {
    [self startPlayingSilentAudio];
}

@end