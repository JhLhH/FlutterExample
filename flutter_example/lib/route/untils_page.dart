import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/gridview_page.dart';

class UntilsPage extends StatefulWidget {
  @override
  _UntilsPageState createState() => _UntilsPageState();
}

class _UntilsPageState extends State<UntilsPage> {
  List<String> titles = ['Cache', 'ExtensionData', 'Date'];

  List<IconData> iconDatas = [Icons.memory, Icons.extension, Icons.alarm];

  Map<String, String> routeNames = {
    'Cache':'cache',
    'Date':'date',
    'ExtensionData': 'ExtensionData'
  };

  @override
  Widget build(BuildContext context) {
    return GridViewPage(
      titles: titles,
      iconDatas: iconDatas,
      routeNames: routeNames,
    );
  }
}
