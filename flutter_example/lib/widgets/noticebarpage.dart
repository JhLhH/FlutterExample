import 'package:flutter/material.dart';
import 'package:noticebar/noticebar.dart';

class NoticeBarPage extends StatefulWidget {
  @override
  _NoticeBarPageState createState() => _NoticeBarPageState();
}

class _NoticeBarPageState extends State<NoticeBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoticeBar'),
      ),
      body: Column(
        children: <Widget>[
          NoticeBar(
            leftWidget: Icon(Icons.print),
              rightWidget: Icon(Icons.add),
              text: '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
