import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
import 'package:searchbar/searchbar.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF0EEF9),
        appBar: AppBar(
          title: Text('SearchBar'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            PopupmenButtonPage(
              titles: ['查看文档'],
//            urls: urls,
            ),
          ],
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child:_getWidget()
        )
    );
  }
  _getWidget(){
    return  Column(
      children: <Widget>[
        SearchBar(
          searchBarType: SearchBarType.center,
          hint: '搜索居中',
          onChanged: (text){
            print('中间搜索框输入内容：$text');
          },
        ),
        SearchBar(
          searchBarType: SearchBarType.normal,
          hint: '搜索左侧',
          onChanged: (text){
            print('普通搜索框输入内容：$text');
          },
        ),
        SearchBar(
          searchBarType: SearchBarType.cancel,
          hint: '搜索+取消',
          onChanged: (text){
            print('取消搜索框输入内容：$text');
          },
        ),
      ],
    );
  }
}
