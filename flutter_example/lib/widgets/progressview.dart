import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
import 'package:progressview/progressview.dart';

class ProgressViewWidgetPage extends StatefulWidget {
  @override
  _ProgressViewWidgetPageState createState() => _ProgressViewWidgetPageState();
}

class _ProgressViewWidgetPageState extends State<ProgressViewWidgetPage>
    with TickerProviderStateMixin {
  List<String> urls = [
    'https://github.com/wya-team/flutter_wya/blob/master/flutter_widgets/progressview/README.md',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Text('ProgressViewWidget'),
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
      body: Center(
        child: ProgressViewWidget(
          colors: [
            Colors.red,
            Colors.amber,
            Colors.cyan,
            Colors.green[200],
            Colors.blue,
            Colors.red
          ],
          radius: 100.0,
          strokeWidth: 8.0,
          strokeCapRound: true,
          value: 0.9,
          totalAngle: 1 * pi,
        ),
      ),
    );
  }
}
