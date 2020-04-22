import 'package:flutter/material.dart';
import 'package:round_checkbox/check_box_describe.dart';
import 'package:round_checkbox/round_checkbox.dart';

class RoundCheckBoxPage extends StatefulWidget {
  @override
  _RoundCheckBoxPageState createState() => _RoundCheckBoxPageState();
}

class _RoundCheckBoxPageState extends State<RoundCheckBoxPage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoundCheckBox'),
      ),
      body: Column(
        children: <Widget>[
          RoundCheckBox(
            value: isCheck,
            onChanged: (flag) {
              setState(() {
                isCheck = flag;
              });
            },
          ),
          CheckBoxDescribe(
            describeText: '这是一个有说明的选择器',
          )
        ],
      ),
    );
  }
}
