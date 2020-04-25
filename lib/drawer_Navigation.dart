import 'package:flutter/material.dart';
import 'package:jtbcommunity/data/urlInfo.dart';
import 'package:provider/provider.dart';

class PageName{
  static String ppomppu      = 'ppomppu';
  static String clien        = 'clien';
  static String todayHumor   = 'todayHumor';
  static String bobe         = 'bobe';
  static String slr          = 'slr';
  static String humoruniv    = 'humoruniv';
  static String ruri         = 'ruri';
}

class InkWellDrawer extends StatelessWidget {  
  @override  
  Widget build (BuildContext context) {  
    return new Drawer(  
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text('Junddao'),
            accountEmail: new Text('y2hunter@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('J'),
            ),
          ),
          new ListTile(
            title: new Text('뽐뿌'),
            onTap : () => selectPage(context, PageName.ppomppu),
          ),
          new Divider(),
          new ListTile(
            title: new Text('클리앙'),
            onTap : () => selectPage(context, PageName.clien),
          ),
          new Divider(),
          new ListTile(
            title: new Text('오늘의 유머'),
            onTap : () => selectPage(context, PageName.todayHumor),
          ),
          new Divider(),
          new ListTile(
            title: new Text('보배드림'),
            onTap : () => selectPage(context, PageName.bobe),
          ),
          new Divider(),
          new ListTile(
            title: new Text('SLR클럽'),
            onTap : () => selectPage(context, PageName.slr),
          ),
          new Divider(),
          new ListTile(
            title: new Text('웃대'),
            onTap : () => selectPage(context, PageName.humoruniv),
          ),
          new Divider(),
          new ListTile(
            title: new Text('루리웹'),
            onTap : () => selectPage(context, PageName.ruri),
          ),
          new Divider(),
          new ListTile(
            title: new Text('닫기'),
            trailing: new Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],),
       
    );  
  }  
  
  void selectPage(BuildContext context, String pageName){
    if(pageName == PageName.ppomppu) Provider.of<UrlInfo>(context).url = 'https://m.ppomppu.co.kr/new/hot_bbs.php';
    if(pageName == PageName.clien) Provider.of<UrlInfo>(context).url = 'https://m.clien.net/service/recommend';
    if(pageName == PageName.bobe) Provider.of<UrlInfo>(context).url = 'https://m.bobaedream.co.kr/board/new_writing/best';
    if(pageName == PageName.ruri) Provider.of<UrlInfo>(context).url = 'https://m.ruliweb.com/best';
    if(pageName == PageName.slr) Provider.of<UrlInfo>(context).url = 'http://m.slrclub.com/l/best_article';
    if(pageName == PageName.humoruniv) Provider.of<UrlInfo>(context).url = 'http://m.humoruniv.com/board/list.html?table=pds&st=day';
    if(pageName == PageName.todayHumor) Provider.of<UrlInfo>(context).url = 'http://m.todayhumor.co.kr/list.php?table=bestofbest';
    
    
    Navigator.of(context).pop();
  }
}  
  