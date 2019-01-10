#import "RespressoStrings.h"
@implementation RespressoStrings
static NSString* const kLocalizationStringsBundleName = @"RespressoStrings.bundle";
static NSString* const kLocalizableStringsTable = @"respresso";
static NSString* const kRespressoBundleId = @"hu.ponte.Respresso";

#pragma mark -

+ (NSBundle*)stringsBundle {
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *stringsBundlePath = [[NSBundle bundleWithIdentifier:kRespressoBundleId] pathForResource:kLocalizationStringsBundleName ofType:@""];
        bundle = [NSBundle bundleWithPath:stringsBundlePath] ?: [NSBundle mainBundle];
    });
    return bundle;
}


+ (NSString*)localizedStringWithKey:(NSString*)key table:(NSString*)table {
    NSBundle* respressoBundle = [RespressoStrings stringsBundle];
    NSString* string = [respressoBundle localizedStringForKey:key value:@"" table:kLocalizableStringsTable];
    if (respressoBundle != nil && ![string isEqualToString:key]) {
        return string;
    }
    return [NSBundle.mainBundle localizedStringForKey:key value:@"" table:table];
}

+ (NSString*)localizedStringWithKey:(NSString*)key {
    return [RespressoStrings localizedStringWithKey:key table:nil];
}
+ (nonnull NSString*)automatical {
        return [RespressoStrings localizedStringWithKey:@"automatical"];
}
+ (nonnull NSString*)collaborative {
        return [RespressoStrings localizedStringWithKey:@"collaborative"];
}
+ (nonnull NSString*)collaborativeMultiplatform {
        return [RespressoStrings localizedStringWithKey:@"collaborative_multiplatform"];
}
+ (nonnull NSString*)helloRespresso {
        return [RespressoStrings localizedStringWithKey:@"hello_respresso"];
}
+ (nonnull NSString*)security {
        return [RespressoStrings localizedStringWithKey:@"security"];
}
@end