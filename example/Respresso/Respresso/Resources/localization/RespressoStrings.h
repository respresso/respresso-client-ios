#import <Foundation/Foundation.h>
@interface RespressoStrings : NSObject
+ (NSString*)localizedStringWithKey:(NSString*)key table:(NSString*)table;
+ (NSString*)localizedStringWithKey:(NSString*)key;
@property(class, nonnull, nonatomic, readonly) NSString* automatical;
@property(class, nonnull, nonatomic, readonly) NSString* collaborative;
@property(class, nonnull, nonatomic, readonly) NSString* collaborativeMultiplatform;
@property(class, nonnull, nonatomic, readonly) NSString* helloRespresso;
@property(class, nonnull, nonatomic, readonly) NSString* security;
@end