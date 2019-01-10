#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "Fonts.h"

static NSString* const kInfoPlistName = @"Info.plist";
static NSString* const kInfoPlistFontsKey = @"UIAppFonts";

static NSString* const kStackerBundleId = @"hu.ponte.Respresso";

@implementation UIFont (Stacker)

+ (void)initialize 
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self registerFonts];
    });
}

+ (void)registerFonts 
{    
    NSBundle* bundle = [NSBundle bundleWithIdentifier:kStackerBundleId];
    
    NSURL* infoPlistURL = [bundle URLForResource:kInfoPlistName withExtension:@""];
    NSDictionary* infos = [NSDictionary dictionaryWithContentsOfURL:infoPlistURL];
    NSArray* fontNames = infos[kInfoPlistFontsKey];
    
    for (NSString *fontName in fontNames) {
        NSURL* url = [bundle URLForResource:fontName withExtension:@""];
        if (url) {
            CFErrorRef error;
            CFURLRef cfUrl = (__bridge CFURLRef)url;
            CTFontManagerRegisterFontsForURL(cfUrl, kCTFontManagerScopeNone, &error);
        }
    }
}

@end
