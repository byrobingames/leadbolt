package;

import openfl.Lib;
import com.stencyl.behavior.Script;

class Leadbolt {

	private static var initialized:Bool=false;

	////////////////////////////////////////////////////////////////////////////
	
	private static var __init:String->Void = function(leadboltId:String){};
	private static var __fetchInterstitial:Void->Void = function(){};
	private static var __showInterstitial:Void->Void = function(){};
	private static var __fetchRewardedVideo:Void->Void = function(){};
	private static var __showRewardedVideo:Void->Void = function(){};
	private static var __presentMediationDebug:Void->Void = function(){};
	
	private static var __adLoaded:Dynamic;
	private static var __adFailedToLoad:Dynamic;
	private static var __adClosed:Dynamic;
	private static var __adClicked:Dynamic;
	private static var __rewardedVideoComplete:Dynamic;
	private static var __rewardedVideoFailToComplete:Dynamic;
	
	////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	public static function fetchInterstitial() 
	{
			if(!initialized) return;
			__fetchInterstitial();
	}
	
	public static function showInterstitial() 
	{
			if(!initialized) return;
			__showInterstitial();
	}
	
	
	public static function fetchRewardedVideo() 
	{	
			if(!initialized) return;
			__fetchRewardedVideo();
	}
	
	public static function showRewardedVideo() 
	{	
			if(!initialized) return;
			__showRewardedVideo();
	}
	
	
	public static function init(leadboltId:String){
	
		#if ios
		if(initialized) return;
		initialized = true;
		try{
			// CPP METHOD LINKING
			__init = cpp.Lib.load("leadbolt","leadbolt_init",1);
			__fetchInterstitial = cpp.Lib.load("leadbolt","leadbolt_interstitial_fetch",0);
			__showInterstitial = cpp.Lib.load("leadbolt","leadbolt_interstitial_show",0);
			__fetchRewardedVideo = cpp.Lib.load("leadbolt","leadbolt_rewardedvideo_fetch",0);
			__showRewardedVideo = cpp.Lib.load("leadbolt","leadbolt_rewardedvideo_show",0);
			__adLoaded = cpp.Lib.load("leadbolt","leadbolt_ad_loaded",0);
			__adFailedToLoad = cpp.Lib.load("leadbolt","leadbolt_ad_failed",0);
			__adClosed = cpp.Lib.load("leadbolt","leadbolt_ad_closed",0);
			__adClicked = cpp.Lib.load("leadbolt","leadbolt_ad_clicked",0);
			__rewardedVideoComplete = cpp.Lib.load("leadbolt","leadbolt_rewardedvideo_complete",0);
			__rewardedVideoFailToComplete = cpp.Lib.load("leadbolt","leadbolt_rewardedvideo_failtocomplete",0);

			__init(leadboltId);
		}catch(e:Dynamic){
			trace("iOS INIT Exception: "+e);
		}
		#end
		
		#if android
		if(initialized) return;
		initialized = true;
		try{
			// JNI METHOD LINKING
			__init = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "init", "(Ljava/lang/String;)V");
			__fetchInterstitial = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "fetchInterstitial", "()V");
			__showInterstitial = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "showInterstitial", "()V");
			__fetchRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "fetchRewardedVideo", "()V");
			__showRewardedVideo = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "showRewardedVideo", "()V");

			__init(leadboltId);
		}catch(e:Dynamic){
			trace("Android INIT Exception: "+e);
		}
		#end
	}
	
	public static function getAdInfo(info:Int):Bool{
        if (info == 0)
        {
			#if ios
           	 return __adLoaded();
            #end
			
			#if android
            	if (__adLoaded == null)
            	{
                	__adLoaded = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "adIsLoaded", "()Z", true);
            	}
            	return __adLoaded();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __adFailedToLoad();
            #end
			
			#if android
            	if (__adFailedToLoad == null)
            	{
                	__adFailedToLoad = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "adFailedToLoad", "()Z", true);
            	}
            	return __adFailedToLoad();
            #end
				
        }else if (info == 2)
        {
			#if ios
           		return __adClosed();
            #end
			
			#if android
            	if (__adClosed == null)
            	{
                	__adClosed = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "adClosed", "()Z", true);
            	}
            	return __adClosed();
            #end
		}
        else
        {
			#if ios
           		return __adClicked();
            #end
			
			#if android
            	if (__adClicked == null)
            	{
                	__adClicked = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "adClicked", "()Z", true);
            	}
            	return __adClicked();
            #end
		}

        return false;
    }
	
	public static function getRewardedVideoInfo(info:Int):Bool{
        if (info == 0)
        {
			#if ios
           	 return __rewardedVideoComplete();
            #end
			
			#if android
            	if (__rewardedVideoComplete == null)
            	{
                	__rewardedVideoComplete = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "rewardedVideoComplete", "()Z", true);
            	}
            	return __rewardedVideoComplete();
            #end			
	
        }
        else if (info == 1)
        {
			#if ios
           		return __rewardedVideoFailToComplete();
            #end
			
			#if android
            	if (__rewardedVideoFailToComplete == null)
            	{
                	__rewardedVideoFailToComplete = openfl.utils.JNI.createStaticMethod("com/byrobin/leadbolt/LeadboltEx", "rewardedVideoFailToComplete", "()Z", true);
            	}
            	return __rewardedVideoFailToComplete();
            #end
				
        }
        return false;
    }		
}