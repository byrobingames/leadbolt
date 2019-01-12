//
//  ATNativeAd.h
//
//  Created by Leadbolt
//  Copyright © 2018 LeadBolt. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@protocol ATNativeAdDelegate;
@class ATNativeAdCollection;

typedef enum {
    ATNativeAdErrorNoConnection=0,
    ATNativeAdErrorNoFill
} ATNativeAdError;

typedef enum {
    ATNativeAdTrackStart=0,
    ATNativeAdTrackProgress25,
    ATNativeAdTrackProgress50,
    ATNativeAdTrackProgress75,
    ATNativeAdTrackEnd,
    ATNativeAdTrackMute,
    ATNativeAdTrackUnmute,
    ATNativeAdTrackPause,
    ATNativeAdTrackResume,
    ATNativeAdTrackReplay,
    ATNativeAdTrackFullscreen,
    ATNativeAdTrackExitFullscreen,
    ATNativeAdTrackAcceptInvitation,
    ATNativeAdTrackSkip
} ATNativeAdTrackEvent;

typedef enum {
    ATNativeAdOptionMediaTypeImage=0,
    ATNativeAdOptionMediaTypeVideo,
    ATNativeAdOptionMediaTypeHTML,
    ATNativeAdOptionMediaTypeAny
} ATNativeAdOptionMediaType;

typedef enum {
    ATNativeAdImageTypeCover=0,
    ATNativeAdImageTypeIcon
} ATNativeAdImageType;

typedef enum {
    ATNativeAdViewType_Height100=0,
    ATNativeAdViewType_Height300
} ATNativeAdViewType;


@interface ATNativeAd : NSObject <SKStoreProductViewControllerDelegate>

@property (readonly) NSString *title;
@property (readonly) NSString *adDescription;
@property (readonly) NSString *callToAction;
@property (readonly) ATNativeAdOptionMediaType mediaType;

@property (readonly) NSString *mediaUrl;
@property (readonly) NSString *iconUrl;
@property (readonly) UIImage *mediaImg;


-(void) downloadImage:(ATNativeAdImageType)type withBlock:(nullable void (^) (UIImage * __nullable image)) block;
-(void) registerViewForInteraction:(UIView * _Nonnull)view withViewController:(UIViewController * _Nonnull)viewController;
-(void) unregisterView;

@end

@protocol ATNativeAdDelegate <NSObject>

@optional
-(void) onAdsLoaded:(ATNativeAdCollection *)collection;
-(void) onAdsFailed:(ATNativeAdError)error;
-(void) onAdClicked:(ATNativeAd *)ad;
-(void) onAdDisplayed:(ATNativeAd *)ad;

@end
