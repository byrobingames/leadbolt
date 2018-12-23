## Stencyl Leadbolt Advertising Extension (Openfl)

For Stencyl 3.4 and above

Stencyl extension for "Leadbolt" (http://www.leadbolt.com) on iOS and Android. This extension allows you to easily integrate Leadbolt on your Stencyl game / application. (http://www.stencyl.com)

### IMPORTENT

This Extension Required the Toolset Extension Manager [https://byrobingames.github.io](https://byrobingames.github.io)

![leadbolttoolset](https://byrobingames.github.io/img/leadbolt/leadbolttoolset.png)

## Main Features

  * Interstitial Support.
  * Rewarded Video Support.

## How to Install

To install this Engine Extension, go to the toolset (byRobin Extension Mananger) in the Extension menu of your game inside Stencyl.<br/>
Select the Engine Extension from the left menu and click on "Download"

If you not have byRobin Extension Mananger installed, install this first.
Go to: [https://byrobingames.github.io](https://byrobingames.github.io)

## Documentation and Block Examples

This extension contains the following blocks. You can find them in your Palette under
the “Extension” tab.<br>

Fill in your API KEY in the Toolset Manager
You can find your API KEY under your Account at Leadbolt.
![leadboltapikey](https://byrobingames.github.io/img/leadbolt/leadboltapikey.png)<br/>
***
**Initialize Leadbolt**
![leadboltinitialize](https://byrobingames.github.io/img/leadbolt/leadboltinitialize.png)<br/>
Use this block to initialize Leadbolt ads. Use this block once per user
session (from the moment the user starts to play until the user quits the game). <br/>
For example in a loading scene.
***
**Load/Show Interstitial Ads**
![leadboltloadshowinterstitial](https://byrobingames.github.io/img/leadbolt/leadboltloadshowinterstitial.png)<br/>
Use this block to load or show the interstitial ad from leadbolt, load before you can show the interstitial.
***
**Load/Show Rewarded Video Ads**
![leadboltloadshowrewarded](https://byrobingames.github.io/img/leadbolt/leadboltloadshowrewarded.png)<br/>
Use this block to load or show the rewarded video from leadbolt, load before you can show the video.
***
**Callbacks Interstitial**
![callback1](https://byrobingames.github.io/img/leadbolt/callbackleadbolt.png)<br/>
Use this block in an “if statement”. Each condition becomes TRUE when a specific
event is happening. Before and after the event, the condition will always be
FALSE.
- “did successfully load”. It becomes TRUE when an Interstitial/Video ad successfully loads.
- “did fail to load”. It becomes TRUE when an Interstitial/Video ad fails to load.
- “is Closed”. It becomes TRUE when an Interstitial/Video ad is closed (dismiss).
- “is Clicked”. It becomes TRUE when an Interstitial/Video ad is Clicked.
***
**Callbacks Rewarded Video**
![callback2](https://byrobingames.github.io/img/leadbolt/callbackrewardedleadbolt.png)<br/>
Use this block in an “if statement”. Each condition becomes TRUE when a specific
event is happening. Before and after the event, the condition will always be
FALSE.
- “has been fully watched” It becomes TRUE when an Rewarded Video ad is fully watched.
- “has not been fully watched” It becomes TRUE when an Rewarded Video ad is not fully watched.

## Version History

- 2015-11-08 (1.1) : First release
- 2016-03-18 (1.2) : Required byRobin Extension Manager to get it work on iOS9
- 2016-09-26 (1.3) : Update SDK to 7.1 for both iOS and Android
- 2017-03-19 (1.4) : Update SDK to 8.0 for both iOS and Android. - Andrdoid Gradle support for openfl4
- 2017-05-16(0.0.5) Tested for Stencyl 3.5, Required byRobin Toolset Extension Manager

## Submitting a Pull Request

This software is opensource.<br/>
If you want to contribute you can make a pull request

Repository: [https://github.com/byrobingames/leadbolt](https://github.com/byrobingames/leadbolt)

Need help with a pull request?<br/>
[https://help.github.com/articles/creating-a-pull-request/](https://help.github.com/articles/creating-a-pull-request/)

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## Privacy Policy

http://www.leadbolt.com/privacy/

## License

Author: Robin Schaafsma

The MIT License (MIT)

Copyright (c) 2014 byRobinGames [http://www.byrobin.nl](http://www.byrobin.nl)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
