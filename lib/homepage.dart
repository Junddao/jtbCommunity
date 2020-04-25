import 'package:flutter/material.dart';
import 'package:jtbcommunity/data/urlInfo.dart';
import 'package:jtbcommunity/drawer_Navigation.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    
    super.initState();
  }

  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        // Here we take the value from the MyHomePage object that was created by  
        // the App.build method, and use it to set our appbar title.  
        title: Text('jtb 베스트 게시판'),  
      ),  
      // drawer: new Drawer(),
      drawer: InkWellDrawer(),  
      body: selectPage(),
      
    );
  }

  Widget selectPage(){
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