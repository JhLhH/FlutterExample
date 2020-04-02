import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:step/time_axis.dart';
import 'package:tableview/tableview.dart';

class StepPage extends StatefulWidget {
  @override
  _StepPageState createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step'),
      ),
      body: TableView(
        sectionNumber: 2,
        numberRowOfSection: (BuildContext context, int index) {
          return 3;
        },
        rowView: (BuildContext context, int section, int row) {
          return TimeAxis(
            style: TimeAxisStyle.circular,
            left:50.0,
            timeText: '这是时间轴',
            paragraphStyle: ParagraphStyle(
              textAlign: TextAlign.center,
            ),
            needLine: section == 1 && row == 2 ? false : true,
            child: SizedBox(
              height: 100,
              child: Text('aaa'),
            ),
          );
        },
      ),
    );
  }
}
