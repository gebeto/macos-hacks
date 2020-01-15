#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>


@interface ACUserVIPInfoPatched : NSObject
    - (BOOL)isVIP;
@end


@implementation ACUserVIPInfoPatched

    + (void)load {
        Class origClass = NSClassFromString(@"ACUserVIPInfo");

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(isVIP)),
            class_getInstanceMethod(NSClassFromString(@"ACUserVIPInfoPatched"), @selector(isVIP))
        );
    }

    - (BOOL) isVIP {
        return YES;
    }

@end

