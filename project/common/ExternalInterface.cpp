#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "LeadboltEx.h"

using namespace leadbolt;


static value leadbolt_init(value leadbolt_id){
	init(val_string(leadbolt_id));
	return alloc_null();
}
DEFINE_PRIM(leadbolt_init,1);

static value leadbolt_interstitial_fetch(){
    fetchInterstitial();
    return alloc_null();
}
DEFINE_PRIM(leadbolt_interstitial_fetch,0);

static value leadbolt_interstitial_show(){
	showInterstitial();
	return alloc_null();
}
DEFINE_PRIM(leadbolt_interstitial_show,0);

static value leadbolt_rewardedvideo_fetch(){
    fetchRewardedVideo();
    return alloc_null();
}
DEFINE_PRIM(leadbolt_rewardedvideo_fetch,0);

static value leadbolt_rewardedvideo_show(){
    showRewardedVideo();
    return alloc_null();
}
DEFINE_PRIM(leadbolt_rewardedvideo_show,0);

//callbacks
static value leadbolt_ad_loaded()
{
    if (leadbolt::adLoaded())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_ad_loaded, 0);

static value leadbolt_ad_failed()
{
    if (leadbolt::adFailToLoad())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_ad_failed, 0);

static value leadbolt_ad_closed()
{
    if (leadbolt::adClosed())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_ad_closed, 0);

static value leadbolt_ad_clicked()
{
    if (leadbolt::adIsClicked())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_ad_clicked, 0);

static value leadbolt_rewardedvideo_complete()
{
    if (leadbolt::completeRewardedVideo())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_rewardedvideo_complete, 0);

static value leadbolt_rewardedvideo_failtocomplete()
{
    if (leadbolt::failToCompleteRewardedVideo())
        return val_true;
    return val_false;
}
DEFINE_PRIM(leadbolt_rewardedvideo_failtocomplete, 0);


extern "C" void leadbolt_main()
{
}
DEFINE_ENTRY_POINT(leadbolt_main);

extern "C" int leadbolt_register_prims()
{
    return 0;
}

