#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>




//
// CCLicenseStore
//

@interface CCLicenseStorePatched : NSObject
- (long long)numberOfTrialDays;
@end

@implementation CCLicenseStorePatched

+ (void)load {
    Class origClass = NSClassFromString(@"CCLicenseStore");

    method_exchangeImplementations(
        class_getInstanceMethod(origClass, @selector(numberOfTrialDays)),
        class_getInstanceMethod(NSClassFromString(@"CCLicenseStorePatched"), @selector(numberOfTrialDays))
    );

    method_exchangeImplementations(
        class_getInstanceMethod(origClass, @selector(isProductLicensed)),
        class_getInstanceMethod(NSClassFromString(@"CCLicenseStorePatched"), @selector(isProductLicensed))
    );
}

- (long long)numberOfTrialDays {
    return 9000;
}

- (bool)isProductLicensed {
    return TRUE;
}

@end

