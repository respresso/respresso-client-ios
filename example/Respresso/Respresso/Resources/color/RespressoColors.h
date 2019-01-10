#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 * This is another comment from flow config.
 */
@interface RespressoColors : NSObject
#if defined UIKIT_DEFINE_AS_PROPERTIES
/**
 * RGBA: #049143FF
 */
@property(class, nonnull, nonatomic, readonly) UIColor* green;
#else
/**
 * RGBA: #049143FF
 */
+ (nonnull UIColor*)green;
#endif
@end