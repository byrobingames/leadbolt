#ifndef LEADBOLTEX_H
#define LEADBOLTEX_H


namespace leadbolt {
	
	
	void init(const char *LeadboltID);
    void fetchInterstitial();
	void showInterstitial();
    void fetchRewardedVideo();
    void showRewardedVideo();
    void presentMediationDebug();
    bool adLoaded();
    bool adFailToLoad();
    bool adClosed();
    bool adIsClicked();
    bool completeRewardedVideo();
    bool failToCompleteRewardedVideo();
    
}


#endif