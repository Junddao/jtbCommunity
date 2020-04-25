import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jtbcommunity/data/urlInfo.dart';
import 'package:jtbcommunity/rootpage.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    new MaterialApp(
      home: CommunityApp(),
    ) 
  );
}

class CommunityApp extends StatefulWidget {
  @override
  _CommunityAppState createState() => _CommunityAppState();
}

class _CommunityAppState extends State<CommunityApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.grey,
      title: 'Community',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('/ J T B /',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white,
      ),),
      
      backgroundColor: Colors.grey[600],
      styleTextUnderTheLoader: new TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white,
      //loadingText: Text('Now Loading'),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    permission();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UrlInfo>( builder : (context) => UrlInfo(),),
        // ChangeNotifierProvider<YoutubeInfo> (builder: (context) => YoutubeInfo(),),
      ] ,
      child: MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[50]
            : null),
        home : RootPage(),
      ),
    );
  }
  
  void permission() async {

    // await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    // await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
  }

}
