/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

#include <LeadboltEx.h>
#import <UIKit/UIKit.h>
#import <AppTracker/AppTracker.h>


using namespace leadbolt;

@interface LeadboltController : NSObject <AppModuleDelegate>
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
#define LOCATION_CODE_REWARD     @"reward"

- (id)initWithID:(NSString*)ID
{
    self = [super init];
    if(!self) return nil;
    
    root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    // Leadbolt SDK initialization
    [AppTracker setAppModuleDelegate:self];
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
    [AppTracker loadModuleToCache:LOCATION_CODE_REWARD];
}

- (void)showRewardedVideoAd
{
    if([AppTracker isAdReady:LOCATION_CODE_REWARD]) {
        [AppTracker loadModule:LOCATION_CODE_REWARD viewController:root];
    }
}

//EventListeners

-(void)onModuleCached:(NSString *)placement
    {
        NSLog(@"Ad cached successfully - %@", placement);
        // Add code if not auto-recaching for when loadModuleModuleToCache is successful
        adLoaded = YES;
    }
-(void)onModuleLoaded:(NSString *)placement
    {
        NSLog(@"Ad loaded successfully - %@", placement);
        // Add code here to pause game and/or all media including audio
    }
-(void)onModuleClicked:(NSString *)placement
    {
        NSLog(@"Ad clicked by user - %@", placement);
        adIsClicked = YES;
    }
-(void)onModuleClosed:(NSString *)placement
    {
        NSLog(@"Ad closed by user - %@", placement);
        // Add code here to resume game and/or all media including audio
         adClosed = YES;
    }
-(void)onModuleClosed:(NSString *)placement reward:(BOOL)reward {
    // Ad closed by user
    NSLog(@"Ad closed by user - %@", placement);
    // Add code here to resume game and/or all media including audio
    adClosed = YES;
    
    if(reward) {
        completeRewardedVideo = YES;
    }
    
    if(([placement isEqual:LOCATION_CODE_REWARD]) && !reward){
        failToCompleteRewardedVideo = YES;
    }
}
-(void)onModuleFailed:(NSString *)placement error:(NSString *)error cached:(BOOL)iscached
    {
        if(iscached) {
            NSLog(@"Ad failed to cache - %@", placement);
            adFailToLoad = NO;
        } else {
            NSLog(@"Ad failed to display - %@", placement);
            adFailToLoad = NO;
        }
    }

//__deprecated_msg("Use onRewardUser instead.")
/*-(void) onMediaFinished:(BOOL)viewCompleted
    {
        if(viewCompleted) {
            NSLog(@"User finished watching rewarded video");
            completeRewardedVideo = YES;
        } else {
            NSLog(@"User skipped watching rewarded video");
            failToCompleteRewardedVideo = YES;
        }
    }*/
    
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
