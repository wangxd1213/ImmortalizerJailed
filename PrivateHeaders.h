#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BSSettings : NSObject
- (NSMutableIndexSet *)allSettings;
- (void)setFlag:(NSUInteger)value forSetting:(NSUInteger)setting;
- (id)objectForSetting:(NSUInteger)setting;
- (BOOL)boolForSetting:(NSUInteger)setting;
@end