#import <UIKit/UIKit.h>


@interface FloatingButton : NSObject
+ (instancetype)sharedInstance;
- (void)showFloatingButtonOnWindow:(UIWindow *)window;
- (void)showToast;
@end

