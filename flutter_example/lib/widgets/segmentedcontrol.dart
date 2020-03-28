import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';

class CustomSegmentedControl extends StatefulWidget {
  @override
  _CustomSegmentedControlState createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  Map<String, Text> map = {'apple': Text('Apple'), 'orange': Text('Orange'), 'banana': Text('Banana')};
  String _fruit = 'apple';

  Map<String, Text> person = {'旗木卡卡西': Text('旗木卡卡西'), '鸣人': Text('鸣人'), '佐助': Text('佐助')};
  String _person = '鸣人';

  Map<String, Text> lol = {'艾瑞莉娅': Text('艾瑞莉娅'), '暗夜猎手': Text('暗夜猎手'), '齐天大圣': Text('齐天大圣')};
  String _lol = '齐天大圣';

  List<String> urls = ['https://api.flutter.dev/flutter/cupertino/CupertinoSegmentedControl-class.html','htps://www.baidu.com'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExtensionData'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupmenButtonPage(
            titles: ['查看文档','查看Demo'],
            urls: urls,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
         Container(
           width: double.infinity,
           height: 120,
           child:  CupertinoSegmentedControl(
             children: map, // 数据
             groupValue: _fruit, // 选中的数据
             onValueChanged: (fruit) {
               setState(() { // 数据改变时通过setState改变选中状态
                 _fruit = fruit;
               });
             },
             unselectedColor: CupertinoColors.white, // 未选中颜色
             selectedColor: CupertinoColors.activeBlue, // 选中颜色
             borderColor: CupertinoColors.activeBlue, // 边框颜色
             pressedColor: const Color(0x33007AFF), // 点击时候的颜色
           ),
         ),
          Container(
           width: double.infinity,
           height: 100,
           child:  CupertinoSegmentedControl(
             children: person, // 数据
             groupValue: _person, // 选中的数据
             onValueChanged: (person) {
               setState(() { // 数据改变时通过setState改变选中状态
                 _person = person;
               });
             },
             unselectedColor: CupertinoColors.white, // 未选中颜色
             selectedColor: CupertinoColors.systemRed, // 选中颜色
             borderColor: CupertinoColors.systemRed, // 边框颜色
             pressedColor: const Color(0x33007AFF), // 点击时候的颜色
           ),
         ),
          Container(
           width: double.infinity,
           height: 120,
           child:  CupertinoSegmentedControl(
             children: lol, // 数据
             groupValue: _lol, // 选中的数据
             onValueChanged: (lol) {
               setState(() { // 数据改变时通过setState改变选中状态
                 _lol = lol;
               });
             },
             unselectedColor: CupertinoColors.white, // 未选中颜色
             selectedColor: CupertinoColors.activeGreen, // 选中颜色
             borderColor: CupertinoColors.activeGreen, // 边框颜色
             pressedColor: const Color(0x33007AFF), // 点击时候的颜色
           ),
         ),
        ],
      ),
    );
  }

}
