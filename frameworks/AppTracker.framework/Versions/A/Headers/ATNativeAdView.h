//
//  ATNativeAdView.h
//
//  Copyright © 2018 LeadBolt. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ATNativeAd.h"

@class ATNativeAdView;


@interface ATNativeAdView : UIView <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *callToActionButton;
@property (weak, nonatomic) IBOutlet UIImageView *mediaImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


+(ATNativeAdView *)nativeAdViewWithAd:(ATNativeAd *)ad withType:(ATNativeAdViewType)type withViewController:(UIViewController *)vC;

@end
