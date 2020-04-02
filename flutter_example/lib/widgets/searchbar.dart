import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
//import 'package:searchbar/searchbar.dart';
//import 'package:searchbar/searchbar_center.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  String value = '';

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
//        SearchBar(
//          title: Text('搜索'),
//          margin: EdgeInsets.all(10),
//          padding: EdgeInsets.only(left: 10, right: 10),
//          height: 44,
//          borderColor: Colors.white,
//          borderWidth: 2,
//          borderRadius: 8,
//        ),
//        SearchBarCenter(
//          title: Text('搜索'),
//          margin: EdgeInsets.all(10),
//          padding: EdgeInsets.only(left: 10, right: 10),
//          height: 44,
//          borderColor: Colors.white,
//          borderWidth: 2,
//          borderRadius: 8,
//          onChanged: (text){
//            print(text);
//          },
//        )
      ],
    );
  }
}
