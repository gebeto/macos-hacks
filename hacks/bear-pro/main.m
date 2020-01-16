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
        [comps setYear:2030];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        return date;
    }

    - (NSDate*) validatedSyncEnabledUntilDate {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:10];
        [comps setMonth:10];
        [comps setYear:2030];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        return date;
    }

@end





// @interface SFNoteCloudKitSyncPatched : NSObject
// // {
// //     BOOL _skipSync;
// //     BOOL _syncDisabledUntilLicenseRestoration;
// //     BOOL _cloudKitSetupComplete;
// //     NSManagedObjectContext *_managedObjectContext;
// //     NSOperationQueue *_syncOperationQueue;
// //     NSOperationQueue *_syncFilesOperationQueue;
// //     NSError *_lastSyncError;
// //     NSDate *_syncEnableUntilDate;
// //     NSDate *_disableSyncUntilDate;
// //     NSManagedObjectContext *_syncManagedObjectContext;
// //     NSManagedObjectContext *_syncFilesManagedObjectContext;
// //     double _coalescenceSyncTimeInterval;
// //     NSTimer *_coalescenceSyncTimer;
// //     NSTimer *_cooldownSyncTimer;
// //     NSTimer *_recurrentSyncTimer;
// //     NSOperationQueue *_cloudKitSetupOperationQueue;
// //     CKRecordZoneID *_privateNotesZoneID;
// //     SFIAPReceiptValidation *_appReceiptValidation;
// //     SFServerMetadata *_serverMetadata;
// //     SFNoteSyncNotifier *_syncNotifier;
// // }

// // @property(retain) SFNoteSyncNotifier *syncNotifier; // @synthesize syncNotifier=_syncNotifier;
// // @property(retain) SFServerMetadata *serverMetadata; // @synthesize serverMetadata=_serverMetadata;
// // @property(retain) SFIAPReceiptValidation *appReceiptValidation; // @synthesize appReceiptValidation=_appReceiptValidation;
// // @property(retain) CKRecordZoneID *privateNotesZoneID; // @synthesize privateNotesZoneID=_privateNotesZoneID;
// // @property(nonatomic) BOOL cloudKitSetupComplete; // @synthesize cloudKitSetupComplete=_cloudKitSetupComplete;
// // @property(retain) NSOperationQueue *cloudKitSetupOperationQueue; // @synthesize cloudKitSetupOperationQueue=_cloudKitSetupOperationQueue;
// @property(nonatomic) BOOL syncDisabledUntilLicenseRestoration; // @synthesize syncDisabledUntilLicenseRestoration=_syncDisabledUntilLicenseRestoration;
// @property(nonatomic) BOOL skipSync; // @synthesize skipSync=_skipSync;
// // @property(retain) NSTimer *recurrentSyncTimer; // @synthesize recurrentSyncTimer=_recurrentSyncTimer;
// // @property(retain) NSTimer *cooldownSyncTimer; // @synthesize cooldownSyncTimer=_cooldownSyncTimer;
// // @property(retain) NSTimer *coalescenceSyncTimer; // @synthesize coalescenceSyncTimer=_coalescenceSyncTimer;
// // @property(nonatomic) double coalescenceSyncTimeInterval; // @synthesize coalescenceSyncTimeInterval=_coalescenceSyncTimeInterval;
// // @property(retain) NSManagedObjectContext *syncFilesManagedObjectContext; // @synthesize syncFilesManagedObjectContext=_syncFilesManagedObjectContext;
// // @property(retain) NSManagedObjectContext *syncManagedObjectContext; // @synthesize syncManagedObjectContext=_syncManagedObjectContext;
// // @property(retain) NSDate *disableSyncUntilDate; // @synthesize disableSyncUntilDate=_disableSyncUntilDate;
// // @property(retain) NSDate *syncEnableUntilDate; // @synthesize syncEnableUntilDate=_syncEnableUntilDate;
// // @property(retain) NSError *lastSyncError; // @synthesize lastSyncError=_lastSyncError;
// // @property(retain) NSOperationQueue *syncFilesOperationQueue; // @synthesize syncFilesOperationQueue=_syncFilesOperationQueue;
// // @property(retain) NSOperationQueue *syncOperationQueue; // @synthesize syncOperationQueue=_syncOperationQueue;
// // @property __weak NSManagedObjectContext *managedObjectContext; // @synthesize managedObjectContext=_managedObjectContext;
// // - (void)deleteNoteCustomZone;
// // - (void)checkICloudAccountStatusWithCompletionHandler:(CDUnknownBlockType)arg1;
// // - (void)handleSyncError:(id)arg1;
// // - (void)resetServerChangeToken;
// // - (void)deleteCloudKitLocalDataInManagedObjectContext:(id)arg1;
// // - (id)loadZoneSubscriptionID;
// // - (void)saveZoneSubscriptionID:(id)arg1;
// // - (id)loadCustomZoneID;
// // - (void)saveCustomZoneID:(id)arg1;
// // - (id)createSubscriptionOperation;
// // - (id)fetchSubscriptionOperation;
// // - (id)createCustomZoneOperation;
// // - (id)fetchCustomZoneOperation;
// // - (id)database;
// // - (void)setupCloudKit;
// // - (void)setSyncSubscriptionEnabledUntil:(id)arg1 appReceiptBase64:(id)arg2 completionBlock:(CDUnknownBlockType)arg3;
// // - (void)getSyncSubscriptionWithCompletionBlock:(CDUnknownBlockType)arg1;
// // - (void)validateSyncSubscriptionFromAppReceipt:(id)arg1 refreshReceiptIfNeeded:(BOOL)arg2 withCompletionBlock:(CDUnknownBlockType)arg3;
// // - (void)validateSyncSubscriptionRefreshReceiptIfNeeded:(BOOL)arg1 withCompletionBlock:(CDUnknownBlockType)arg2;
// // - (void)validateSyncSubscription;
// // - (void)setSyncCoalescenceNormal;
// // - (void)setSyncCoalescenceSlow;
// // - (void)disableSyncUntilLicenseRestoration;
// // - (void)enableSyncWithSyncExpirationDate:(id)arg1;
// // - (void)stopSyncAndPreventItForTimeInterval:(double)arg1;
// // - (void)setCurrentSyncCompletionBlock:(CDUnknownBlockType)arg1;
// - (BOOL)isGoingToSync;
// // - (BOOL)isAdditionalSyncScheduled;
// - (BOOL)isSyncing;
// // - (BOOL)isLongSync;
// // - (void)syncFilesAfterSyncOperation:(id)arg1;
// // - (void)syncAllowingBGSync:(BOOL)arg1;
// // - (void)sync;
// // - (void)syncRecurrentTimerFired:(id)arg1;
// // - (void)startSyncRecurrentTimer;
// // - (void)cooldownSyncTimerFired:(id)arg1;
// // - (void)startSyncCooldownTimer;
// // - (void)syncUsingCooldown;
// // - (void)coalescenceSyncTimerFired:(id)arg1;
// // - (void)syncUsingCoalescence:(BOOL)arg1;
// // - (void)saveWithoutSync;
// // - (void)setupObserver;
// // - (id)initWithManagedObjectContext:(id)arg1;

// @end




// @implementation SFNoteCloudKitSyncPatched

//     + (void)load {
//         Class origClass = NSClassFromString(@"SFNoteCloudKitSync");

//         method_exchangeImplementations(
//             class_getInstanceMethod(origClass, @selector(skipSync)),
//             class_getInstanceMethod(NSClassFromString(@"SFNoteCloudKitSyncPatched"), @selector(skipSync))
//         );

//         method_exchangeImplementations(
//             class_getInstanceMethod(origClass, @selector(syncDisabledUntilLicenseRestoration)),
//             class_getInstanceMethod(NSClassFromString(@"SFNoteCloudKitSyncPatched"), @selector(syncDisabledUntilLicenseRestoration))
//         );

//         method_exchangeImplementations(
//             class_getInstanceMethod(origClass, @selector(isGoingToSync)),
//             class_getInstanceMethod(NSClassFromString(@"SFNoteCloudKitSyncPatched"), @selector(isGoingToSync))
//         );

//         method_exchangeImplementations(
//             class_getInstanceMethod(origClass, @selector(isSyncing)),
//             class_getInstanceMethod(NSClassFromString(@"SFNoteCloudKitSyncPatched"), @selector(isSyncing))
//         );
//     }

//     - (BOOL) skipSync {
//         return FALSE;
//     }
//     - (BOOL) isGoingToSync {
//         return TRUE;
//     }

//     - (BOOL) isSyncing {
//         return TRUE;
//     }

//     - (BOOL)syncDisabledUntilLicenseRestoration {
//         return FALSE;
//     }

// @end