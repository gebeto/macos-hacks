#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>


@interface SFNotesPreferenceManagerPatched : NSObject
    - (NSDate*) syncEnabledUntilDate;
    - (NSDate*) validatedSyncEnabledUntilDate;
    - (BOOL)isProSubscriptionValid;
@end


@implementation SFNotesPreferenceManagerPatched

    + (void)load {
        Class origClass = NSClassFromString(@"SFNotesPreferenceManager");

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(isProSubscriptionValid)),
            class_getInstanceMethod(NSClassFromString(@"SFNotesPreferenceManagerPatched"), @selector(isProSubscriptionValid))
        );

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(syncEnabledUntilDate)),
            class_getInstanceMethod(NSClassFromString(@"SFNotesPreferenceManagerPatched"), @selector(syncEnabledUntilDate))
        );

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(validatedSyncEnabledUntilDate)),
            class_getInstanceMethod(NSClassFromString(@"SFNotesPreferenceManagerPatched"), @selector(validatedSyncEnabledUntilDate))
        );
    }

    - (BOOL)isProSubscriptionValid {
        return TRUE;
    }

    - (NSDate*) syncEnabledUntilDate {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:10];
        [comps setMonth:10];
        [comps setYear:2022];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        return date;
    }

    - (NSDate*) validatedSyncEnabledUntilDate {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:10];
        [comps setMonth:10];
        [comps setYear:2022];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        return date;
    }

@end


@interface SFNotesIAPPurchasesPatched : NSObject
@property(nonatomic) BOOL subscriptionValidated;

@end

@implementation SFNotesIAPPurchasesPatched

    + (void)load {
        Class origClass = NSClassFromString(@"SFNotesIAPPurchases");

        method_exchangeImplementations(
            class_getInstanceMethod(origClass, @selector(subscriptionValidated)),
            class_getInstanceMethod(NSClassFromString(@"SFNotesIAPPurchasesPatched"), @selector(subscriptionValidated))
        );
    }

    - (BOOL) subscriptionValidated {
        return TRUE;
    }

@end