/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

#include <LeadboltEx.h>
#import <UIKit/UIKit.h>
#import "AppTracker.h"


using namespace leadbolt;

@interface LeadboltController : NSObject
{
    UIViewController *root;
    
    BOOL adLoaded;
    BOOL adFailToLoad;
    BOOL adClosed;
    BOOL adClicked;
    BOOL completeRewardedVideo;
    BOOL failToCompleteRewardedVideo;
}

@property (nonatomic, assign) BOOL adLoaded;
@property (nonatomic, assign) BOOL adFailToLoad;
@property (nonatomic, assign) BOOL adClosed;
@property (nonatomic, assign) BOOL adIsClicked;
@property (nonatomic, assign) BOOL completeRewardedVideo;
@property (nonatomic, assign) BOOL failToCompleteRewardedVideo;
@end

@implementation LeadboltController

@synthesize adLoaded;
@synthesize adFailToLoad;
@synthesize adClosed;
@synthesize adIsClicked;
@synthesize completeRewardedVideo;
@synthesize failToCompleteRewardedVideo;

#define LOCATION_CODE_INAPP     @"inapp"
#define LOCATION_CODE_VIDEO     @"video"

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    // Leadbolt SDK initialization
    [AppTracker enableLog:YES];
    [self initializeEventListeners];
    [AppTracker startSession:ID];
    
    return self;
}

- (void)fetchInterstitialAd
{
        [AppTracker loadModuleToCache:LOCATION_CODE_INAPP];
}

     
- (void)showInterstitialAd
{
    
    if([AppTracker isAdReady:LOCATION_CODE_INAPP]) {
        [AppTracker loadModule:LOCATION_CODE_INAPP viewController:root];
    }
}

- (void)fetchRewardedVideoAd
{
    [AppTracker loadModuleToCache:LOCATION_CODE_VIDEO];
}

- (void)showRewardedVideoAd
{
    if([AppTracker isAdReady:LOCATION_CODE_VIDEO]) {
        [AppTracker loadModule:LOCATION_CODE_VIDEO viewController:root];
    }
}

//EventListeners
-(void)initializeEventListeners
{
    // Update this to trigger relevant sdk event listeners
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSString *afw = @"AppFireworksNotification";
    [nc addObserverForName:@"onModuleLoaded" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
        //adLoaded = YES;
        //NSLog(@"Ad displayed");
        
    }];
    [nc addObserverForName:@"onModuleFailed" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
        if([[notif.userInfo objectForKey:@"cached"] isEqualToString:@"yes"]) {
            adFailToLoad = NO;
        } else {
           adFailToLoad = NO;
        }
    }];
    [nc addObserverForName:@"onModuleClosed" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
         adClosed = YES;
    }];
    [nc addObserverForName:@"onModuleCached" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
        adLoaded = YES;
        //NSLog(@"Ad successfully cached");
        // Ad has been cached, now enable the Show Ad button
    }];
    [nc addObserverForName:@"onModuleClicked" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
        adIsClicked = YES;
    }];
    [nc addObserverForName:@"onMediaFinished" object:afw queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notif) {
        if([[notif.userInfo objectForKey:@"viewCompleted"] isEqualToString:@"yes"]) {
            completeRewardedVideo = YES;
        } else {
            failToCompleteRewardedVideo = YES;
        }
    }];
}


@end

namespace leadbolt {
	
	static LeadboltController *adController;
    static NSString *leadboltID;
    
	void init(const char *LeadboltID){
        
        if(adController == NULL)
        {
            adController = [[LeadboltController alloc] init];
        }
        
        leadboltID = [NSString stringWithUTF8String:LeadboltID];
        
        [adController initWithID:leadboltID];
    }
    
    void fetchInterstitial()
    {
        if(adController!=NULL)
        {
            [adController fetchInterstitialAd];
        }
    }
    
    void showInterstitial()
    {
        if(adController!=NULL)
        {
            [adController showInterstitialAd];
        }
    }
    
    void fetchRewardedVideo()
    {
        if(adController!=NULL)
        {
            [adController fetchRewardedVideoAd];
        }
    }
    
    void showRewardedVideo()
    {
        if(adController!=NULL)
        {
            [adController showRewardedVideoAd];
        }
    }
    
    
//Callbacks
    
    bool adLoaded()
    {
        if(adController != NULL)
        {
            if (adController.adLoaded)
            {
                adController.adLoaded = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adFailToLoad()
    {
        if(adController != NULL)
        {
            if (adController.adFailToLoad)
            {
                adController.adFailToLoad = NO;
                return true;
            }
        }
        return false;
    }

    bool adClosed()
    {
        if(adController != NULL)
        {
            if (adController.adClosed)
            {
                adController.adClosed = NO;
                return true;
            }
        }
        return false;
    }
    
    bool adIsClicked()
    {
        if(adController != NULL)
        {
            if (adController.adIsClicked)
            {
                adController.adIsClicked = NO;
                return true;
            }
        }
        return false;
    }
    
    bool completeRewardedVideo()
    {
        if(adController != NULL)
        {
            if (adController.completeRewardedVideo)
            {
                adController.completeRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }
    
    bool failToCompleteRewardedVideo()
    {
        if(adController != NULL)
        {
            if (adController.failToCompleteRewardedVideo)
            {
                adController.failToCompleteRewardedVideo = NO;
                return true;
            }
        }
        return false;
    }

    
}
