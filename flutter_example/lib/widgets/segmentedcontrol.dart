import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
import 'package:segmentcontrol/segmentcontrol.dart';

class CustomSegmentedControl extends StatefulWidget {
  @override
  _CustomSegmentedControlState createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  static Map<String, Text> map = {
    'apple': Text('Apple'),
    'orange': Text('Orange'),
    'banana': Text('Banana')
  };
  String _fruit = 'apple';

  static Map<String, Text> person = {
    '旗木卡卡西': Text('旗木卡卡西'),
    '鸣人': Text('鸣人'),
    '佐助': Text('佐助')
  };
  String _person = '鸣人';

  static Map<String, Text> lol = {
    '艾瑞莉娅': Text('艾瑞莉娅'),
    '暗夜猎手': Text('暗夜猎手'),
    '齐天大圣': Text('齐天大圣')
  };

  String _lol = '齐天大圣';

  List<String> urls = [
    'https://github.com/wya-team/flutter_wya/blob/master/flutter_widgets/segmentcontrol/README.md',
  ];

  List<Color> colors = [
    CupertinoColors.activeBlue,
    CupertinoColors.systemRed,
    CupertinoColors.activeGreen
  ];

  List<Map<String, Text>> dataSources = [map, person, lol];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SegmentedControl'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupmenButtonPage(
            titles: ['查看文档'],
            urls: urls,
          ),
        ],
      ),
      body: Column(
        children: _getSegmentControlItems(),
      ),
    );
  }

  _getSegmentControlItems() {
    List<Widget> items = [];
    items.add(_getSegmentControlItem(dataSources[0], _fruit, colors[0], 0));
    items.add(_getSegmentControlItem(dataSources[1], _person, colors[1], 1));
    items.add(_getSegmentControlItem(dataSources[2], _lol, colors[2], 2));
    return items;
  }

  _getSegmentControlItem(Map<String, Text> children, String selectedFlag,
      Color selectedColor, int index) {
    return SegmentControl(
      children: children,
      groupValue: selectedFlag,
      onValueChanged: (value) {
        setState(() {
          if (index == 0) {
            _fruit = value;
          } else if (index == 1) {
            _person = value;
          } else if (index == 2) {
            _lol = value;
          }
        });
      },
      width: double.infinity,
      height: 120,
      unselectedColor: CupertinoColors.white,
      // 未选中颜色
      selectedColor: selectedColor,
      // 选中颜色
      borderColor: selectedColor,
      // 边框颜色
      pressedColor: const Color(0x33007AFF), // 点击时候的颜色
    );
  }
}
