import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/gridview_page.dart';

class WidgetsPage extends StatefulWidget {
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  List<String> titles = [
    'Dialog',
    'Toast',
    'ImagePreview',
    'NoticeBar',
    'ProgressView',
    'SearchBar',
    'Slider',
    'LoginTextField',
    'Step',
    'TableView',
    'SegmentedControl',
    'RoundCheckBox',
  ];

  List<IconData> iconDatas = [
    Icons.add_alert,
    Icons.notifications_paused,
    Icons.image,
    Icons.notifications,
    Icons.donut_large,
    Icons.search,
    Icons.slideshow,
    Icons.exit_to_app,
    Icons.format_list_numbered,
    Icons.list,
    Icons.work,
    Icons.check_circle,
  ];

  Map<String, String> routeName = {
    'TableView': 'tableview',
    'SegmentedControl': 'SegmentedControl',
    'Dialog': 'dialog',
    'Toast': 'toast',
    'SearchBar':'SearchBar',
    'NoticeBar': 'noticebar',
    'RoundCheckBox': 'checkbox',
    'Step': 'step',
    'ProgressView': 'progressview',
    'ImagePreview' : 'imagepreview',
  };

  @override
  Widget build(BuildContext context) {
    return GridViewPage(
      titles: titles,
      iconDatas: iconDatas,
      routeNames: routeName,
    );
  }
}
