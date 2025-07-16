#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BSSettings : NSObject
- (NSMutableIndexSet *)allSettings;
- (BOOL)boolForSetting:(NSUInteger)setting;
- (id)objectForSetting:(NSUInteger)setting;
- (void)setFlag:(NSUInteger)value forSetting:(NSUInteger)setting;
@end

