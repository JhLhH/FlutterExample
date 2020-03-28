import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';

class ExtensionDataPage extends StatefulWidget {
  @override
  _ExtensionDataPageState createState() => _ExtensionDataPageState();
}

class _ExtensionDataPageState extends State<ExtensionDataPage> {
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
        actions: <Widget>[PopupmenButtonPage()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            alignment: Alignment.topLeft,
            child: Text(
              '简介',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text('用于对集合以及字符串的一些安全操作', style: TextStyle(color: Colors.white, fontSize: 16)),
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Text('''1.'''),
          )
        ],
      ),
    );
  }
}
