## Stencyl Leadbolt Advertising Extension (Openfl)

For Stencyl 3.4 and above

Stencyl extension for "Leadbolt" (http://www.leadbolt.com) on iOS and Android. This extension allows you to easily integrate Leadbolt on your Stencyl game / application. (http://www.stencyl.com)

## Main Features

  * Interstitial Support.
  * Rewarded Video Support.

## How to Install

Go To: http://byrobin.nl/store/product/leadbolt-advertising-for-ios-android-stencylopenfl/

Add the extension to the cart en proceed with checkout. After you successfully placed the order, you will get an e-mail with the download link or go to “<strong>My Account</strong>” section where you can also find the download link.

Or

Use "Download Zip" on this page

Install the zip file: Go to : <a href="http://community.stencyl.com/index.php/topic,30432.0.html" target="_blank">http://community.stencyl.com/index.php/topic,30432.0.html</a>

###IMPORTENT

To get it work on IOS you have to Download, Install and Enable “<a href="http://byrobin.nl/store/product/byrobin-extension-manager-stencylopenfl/">byRobin Extension Manager</a>”


## Documentation and Block Examples

This extension contains the following blocks. You can find them in your Palette under
the “Extension” tab.<br>

![initleadbolt](http://www.byrobingames.com/stencyl/leadbolt/initleadbolt.png)</br>
Use this block to initialize your Leadbolt. Use this block once per user
session (from the moment the user starts to play until the user quits the game). For example in a loading scene.

![loadinterstitial](http://www.byrobingames.com/stencyl/leadbolt/loadinterstitialleadbolt.png)</br>
Use this block to load the interstitial ad from leadbolt, before you can show the interstitial. (When scene is created)

![showinterstitial](http://www.byrobingames.com/stencyl/leadbolt/showinterstitialleadbolt.png)</br>
Use this block to show the interstitial ad after you load the interstitial. (Show when gameover)

![loadrewarded](http://www.byrobingames.com/stencyl/leadbolt/loadrewardedleadbolt.png)</br>
Use this block to load the rewarded video from leadbolt, before you can show the video. (When scene is created)

![showrewarded](http://www.byrobingames.com/stencyl/leadbolt/showrewardedleadbolt.png)</br>
Use this block to show the rewarded video after you load the video. (Show when gameover)

![callback1](http://www.byrobingames.com/stencyl/leadbolt/callbackleadbolt.png)</br>
Use this block in an “if statement”. Each condition becomes TRUE when a specific
event is happening. Before and after the event, the condition will always be
FALSE.
- “did successfully load”. It becomes TRUE when an Interstitial/Video ad successfully loads.
- “did fail to load”. It becomes TRUE when an Interstitial/Video ad fails to load.
- “is Closed”. It becomes TRUE when an Interstitial/Video ad is closed (dismiss).
- “is Clicked”. It becomes TRUE when an Interstitial/Video ad is Clicked.

![callback2](http://www.byrobingames.com/stencyl/leadbolt/callbackrewardedleadbolt.png)</br>
Use this block in an “if statement”. Each condition becomes TRUE when a specific
event is happening. Before and after the event, the condition will always be
FALSE.
- “has been fully watched” It becomes TRUE when an Rewarded Video ad is fully watched.
- “has not been fully watched” It becomes TRUE when an Rewarded Video ad is not fully watched.


//TODO examples

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## Privacy Policy

http://www.leadbolt.com/privacy/

## License

The MIT License (MIT) - LICENSE.md

Copyright © 2014 byRobinGames (http://www.byrobingames.com)

Author: Robin Schaafsma
