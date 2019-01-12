//
//  AppTracker.h - v9.0
//
//  Created by Leadbolt.
//  Copyright (c) 2018 Leadbolt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "ATNativeAd.h"
#import "ATNativeAdOptions.h"
#import "ATNativeAdCollection.h"
#import "ATNativeAdView.h"

@protocol AppModuleDelegate <NSObject>

@optional
-(void) onModuleLoaded:(NSString *)placement;
-(void) onModuleClosed:(NSString *)placement reward:(BOOL)reward;
-(void) onModuleClicked:(NSString *)placement;
-(void) onModuleCached:(NSString *)placement;
-(void) onModuleFailed:(NSString *)placement error:(NSString *)error cached:(BOOL)iscached;
//-(void) onMediaFinished:(BOOL)viewCompleted __deprecated_msg("Use onRewardUser instead.");;


@end

@interface AppTracker : NSObject

typedef enum {
    AppTrackerDisableAutoCache=0,
    AppTrackerEnableAutoCache
} AdCacheOption;


/// Start, close, sync
+(void) startSession:(NSString *)apiKey;
+(void) startSession:(NSString *)apiKey withOption:(AdCacheOption) option;
+(void) closeSession;

// Module functions
+(void) loadModule:(NSString*) placement viewController:(UIViewController*)viewController;
+(void) loadModule:(NSString*) placement viewController:(UIViewController*)viewController withUserData:(NSString*)userData;
+(void) loadModuleToCache:(NSString*) placement;
+(void) loadModuleToCache:(NSString*) placement withUserData:(NSString*)userData;
+(void) destroyModule;


typedef enum {
    AdOrientation_AutoDetect=0,
    AdOrientation_Landscape,
    AdOrientation_Portrait
} AdOrientation __deprecated_msg("No longer needed");

// force Ad Orientation
+(void) fixAdOrientation:(AdOrientation)orientation __deprecated_msg("No longer needed");

+(void)setAppModuleDelegate:(id<AppModuleDelegate>)delegate;

+(BOOL) isAdReady:(NSString *)placement;

//Demographics function
+(void) setAgeRange:(NSString *)range; // accepted values "13-17", "18-25", "26-35", "36-45", "46+"
+(void) setGender:(NSString *)gender; // accepted valued "Male", "Female"

+(void) setFramework:(NSString *)framework;


// Native Ad methods
+(void) loadNativeAds;
+(void) loadNativeAdsWithCaching;
+(void) setNativeAdDelegate:(id<ATNativeAdDelegate>)delegate;
+(ATNativeAdView *)nativeAdViewWithAd:(ATNativeAd *)ad withType:(ATNativeAdViewType)type withViewController:(UIViewController *)vC;


@end
