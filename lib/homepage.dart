import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:jtbcommunity/data/urlInfo.dart';
import 'package:jtbcommunity/drawer_Navigation.dart';
import 'package:jtbcommunity/service/myadshelper.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatelessWidget {

  WebViewController _webViewController;
  
  @override
  Widget build(BuildContext context) {
    
    String appId = "ca-app-pub-9695790043722201~5349051219";
    String adUnitId = "ca-app-pub-9695790043722201/4535976073";
    FirebaseAdMob.instance.initialize(appId: appId);

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['game', 'lol'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[], // Android emulators are considered test devices
    );

    InterstitialAd myInterstitial = InterstitialAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: adUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );

    myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );

    return Scaffold(  
      appBar: AppBar(  
        // Here we take the value from the MyHomePage object that was created by  
        // the App.build method, and use it to set our appbar title.  
        title: Text('jtb 베스트 게시판'),  
      ),  
      // drawer: new Drawer(),
      drawer: InkWellDrawer(),  
      body: Column(children: [
        
        Expanded(
          flex: 1,
          child: selectPage(context),
        ),
        
        // Ads.showBanner(),
      ],)
      
      
    );
  }
  
  Widget selectPage(BuildContext context){
    String url = Provider.of<UrlInfo>(context).url;
    Widget returnWidget;
    if(url == 'empty'){
      returnWidget = emptyPage();
    }
    else {
      returnWidget = webPage(url);
      if(_webViewController != null){
        _webViewController.loadUrl(url);

      }
    }
    return returnWidget;
  }
  
  Widget emptyPage(){
    return Container(
      alignment: Alignment.center,
        child : new Text ('게시판을 선택하세요.'),
    );
  }

  Widget webPage(String url){
    
    
    return WillPopScope(
      onWillPop: () async {
        var future = _webViewController.canGoBack();
        future.then((canGoBack) {
          if (canGoBack) {
            _webViewController.goBack();
          } 
        });
        return Future.value(false);
      },
      child : Scaffold(
        body: SafeArea(
          child : WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },


          ),
        ),
      ),
    );
    
  }

}