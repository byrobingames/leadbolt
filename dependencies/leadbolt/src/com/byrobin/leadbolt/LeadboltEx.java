/*
 *
 * Created by Robin Schaafsma
 * www.byrobingames.com
 *
 */

package com.byrobin.leadbolt;

import com.apptracker.android.listener.AppModuleListener;
import com.apptracker.android.track.AppTracker;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;
import android.util.Log;

import org.haxe.extension.Extension;


public class LeadboltEx extends Extension {


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
    private static boolean adLoaded = false;
    private static boolean adFailedToLoad = false;
    private static boolean adClicked =false;
    private static boolean adClosed =false;
    private static boolean completeRewardedVideo =false;
    private static boolean failToCompleteRewardedVideo =false;
	private static String LeadboltId=null;
    


	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
   
    public void onCreate(Bundle savedInstanceState)
    {
        AppTracker.setModuleListener(leadboltListener);
    }
    
    static public void init(final String LeadboltId){
		LeadboltEx.LeadboltId=LeadboltId;
		
		Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run() 
			{ 
			
				Log.d("LeadboltEx","Init Leadbolt");
                AppTracker.startSession(Extension.mainActivity,LeadboltId);
                
			}
		});	
	}

    static public void fetchInterstitial() {
        Log.d("LeadboltEx","Fetch Interstitial Begin");
        if(LeadboltId=="") return;
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                AppTracker.loadModuleToCache(Extension.mainActivity,"inapp");
            }
        });
        Log.d("LeadboltEx","Fetch Interstitial End");
    }
    
	static public void showInterstitial() {
        Log.d("LeadboltEx","Show Interstitial Begin");
		if(LeadboltId=="") return;
		Extension.mainActivity.runOnUiThread(new Runnable() {
			public void run()
            {
                
                if(AppTracker.isAdReady("inapp")) {
                    AppTracker.loadModule(Extension.mainActivity,"inapp");
                }
                
            }
		});
		Log.d("LeadboltEx","Show Interstitial End");
	}
    
    static public void fetchRewardedVideo() {
        Log.d("LeadboltEx","Fetch Rewarded Video Begin");
        if(LeadboltId=="") return;
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                AppTracker.loadModuleToCache(Extension.mainActivity,"video");
            }
        });
        Log.d("LeadboltEx","Fetch Rewarded Video End");
    }
    
    static public void showRewardedVideo() {
        Log.d("LeadboltEx","Show Rewarded Video Begin");
        if(LeadboltId=="") return;
        Extension.mainActivity.runOnUiThread(new Runnable() {
            public void run()
            {
                
                if(AppTracker.isAdReady("video")) {
                    AppTracker.loadModule(Extension.mainActivity,"video");
                }
                
            }
        });
        Log.d("LeadboltEx","Show Rewarded Video End");
    }
    
    
	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
    static public boolean adIsLoaded()
    {
        if (adLoaded)
        {
            adLoaded = false;
            return true;
        }
        return false;
    }
    
    static public boolean adFailedToLoad()
    {
        if (adFailedToLoad)
        {
            adFailedToLoad = false;
            return true;
        }
        return false;
    }
    
    static public boolean adClosed()
    {
        if (adClosed)
        {
            adClosed = false;
            return true;
        }
        return false;
    }
    
    
    static public boolean adClicked()
    {
        if (adClicked)
        {
            adClicked = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedVideoComplete()
    {
        if (completeRewardedVideo)
        {
            completeRewardedVideo = false;
            return true;
        }
        return false;
    }
    
    static public boolean rewardedVideoFailToComplete()
    {
        if (failToCompleteRewardedVideo)
        {
            failToCompleteRewardedVideo = false;
            return true;
        }
        return false;
    }
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////
    
    private AppModuleListener leadboltListener = new AppModuleListener() {
        @Override
        public void onModuleLoaded(String location) {
            Log.i("AppTracker", "Ad loaded successfully - "+location);
            adLoaded = true;
        }
        @Override
        public void onModuleFailed(String location, String error, boolean isCache) {
            if(isCache) {
                Log.i("AppTracker", "Ad failed to cache - "+location);
                adFailedToLoad = true;
            } else {
                Log.i("AppTracker", "Ad failed to display - "+location);
                adFailedToLoad = true;
            }
        }
        @Override
        public void onModuleClosed(String location) {
            Log.i("AppTracker", "Ad closed by user - "+location);
            adClosed = true;
        }
        @Override
        public void onModuleClicked(String location) {
            Log.i("AppTracker", "Ad clicked by user - "+location);
            adClicked = true;
        }
        @Override
        public void onModuleCached(String location) {
            Log.i("AppTracker", "Ad cached successfully - "+location);
            adLoaded = true;
        }
        @Override
        public void onMediaFinished(boolean viewCompleted) {
            if(viewCompleted) {
                Log.i("AppTracker", "User finished watching rewarded video");
                completeRewardedVideo = true;
            } else {
                Log.i("AppTracker", "User skipped watching rewarded video");
                failToCompleteRewardedVideo = true;
            }
        }
    };


}
