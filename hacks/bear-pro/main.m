#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>


@interface SFNotesPreferenceManagerPatched : NSObject
    - (BOOL)isProSubscriptionValid;
@end


@implementation SFNotesPreferenceManagerPatched

    + (void)load {
        Class origClass = NSClassFromString(@"SFNotesPreferenceManager");

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(isProSubscriptionValid)),
            class_getInstanceMethod(NSClassFromString(@"SFNotesPreferenceManagerPatched"), @selector(isProSubscriptionValid))
        );
    }

    - (BOOL)isProSubscriptionValid {
        return TRUE;
    }

@end

