import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:step/time_axis.dart';
import 'package:tableview/tableview.dart';

class StepPage extends StatefulWidget {
  @override
  _StepPageState createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {

  Widget sectionHeaderView(int index){
    if(index == 0 || index == 1 || index == 2){
      return Text('纵向时间轴');
    } else {
      return Text('横向时间轴');
    }
  }

  Widget verticalTextRow(int section, int row) {
    return TimeAxis(
      style: TimeAxisStyle.text,
      left: 50.0,
      timeText: '${section}/${row}',
      paragraphStyle: ParagraphStyle(
        textAlign: TextAlign.center,
      ),
      verticalNeedLine: section == 0 && row == 2 ? false : true,
      child: SizedBox(
        height: 60,
        child: Column(
          children: <Widget>[
            Text('aaa'),
            Text('aaa'),
          ],
        ),
      ),
    );
  }

  Widget verticalCircleRow(int section, int row) {
    return TimeAxis(
      style: TimeAxisStyle.circular,
      left: 50.0,
      timeText: '这是时间轴',
      paragraphStyle: ParagraphStyle(
        textAlign: TextAlign.center,
      ),
      verticalNeedLine: section == 1 && row == 2 ? false : true,
      child: SizedBox(
        height: 60,
        child: Column(
          children: <Widget>[
            Text('aaa'),
            Text('aaa'),
          ],
        ),
      ),
    );
  }

  Widget verticalMixtureRow(int section, int row) {
    return TimeAxis(
      style: row == 1 ? TimeAxisStyle.text : TimeAxisStyle.circular ,
      left: 50.0,
      timeText: '${section}/${row}',
      paragraphStyle: ParagraphStyle(
        textAlign: TextAlign.center,
      ),
      verticalNeedLine: section == 2 && row == 2 ? false : true,
      child: SizedBox(
        height: 60,
        child: Column(
          children: <Widget>[
            Text('aaa'),
            Text('aaa'),
          ],
        ),
      ),
    );
  }

  Widget horizontalTextRowView(int section, int row) {
    return Row(
      children: <Widget>[
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.text,
          left: 60.0,
          timeText: '01/01',
          paragraphStyle: ParagraphStyle(
            textAlign: TextAlign.left,
          ),
          horizontalNeedLeftLine: false,
          horizontalNeedRightLine: true,
          child: SizedBox(
//            height: 60,
          width:60,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.text,
          left: 80.0,
          timeText: '01/02',
          paragraphStyle: ParagraphStyle(
            textAlign: TextAlign.left,
          ),
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: true,
          child: SizedBox(
//            height: 60,
            width:80,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.text,
          left: 60.0,
          timeText: '01/03',
          paragraphStyle: ParagraphStyle(
            textAlign: TextAlign.left,
          ),
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: false,
          child: SizedBox(
//            height: 60,
            width:60,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget horizontalCircleRowView(int section, int row) {
    return Row(
      children: <Widget>[
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.circular,
          left: 60.0,
          horizontalNeedLeftLine: false,
          horizontalNeedRightLine: true,
          child: SizedBox(
            width:60,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.circular,
          left: 80.0,
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: true,
          fillColor: Colors.blue,
          child: SizedBox(
            width:80,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.circular,
          left: 100.0,
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: false,
          child: SizedBox(
            width:100,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget horizontalMixtureRowView(int section, int row) {
    return Row(
      children: <Widget>[
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.circular,
          left: 60.0,
          horizontalNeedLeftLine: false,
          horizontalNeedRightLine: true,
          child: SizedBox(
            width:60,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.text,
          left: 80.0,
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: true,
          fillColor: Colors.blue,
          timeText: '中间的',
          paragraphStyle: ParagraphStyle(
            textAlign: TextAlign.left,
          ),
          child: SizedBox(
            width:80,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        ),
        TimeAxis(
          direction: Axis.horizontal,
          style: TimeAxisStyle.circular,
          left: 100.0,
          horizontalNeedLeftLine: true,
          horizontalNeedRightLine: false,
          child: SizedBox(
            width:100,
            child: Column(
              children: <Widget>[
                Text('aaa'),
                Text('aaa'),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step'),
      ),
      body: TableView(
        sectionNumber: 6,
        numberRowOfSection: (BuildContext context, int index) {
          if (index == 0 || index == 1 || index == 2) {
            return 3;
          }
          return 1;
        },
        sectionHeaderView: (BuildContext context, int index){
          return sectionHeaderView(index);
        },
        rowView: (BuildContext context, int section, int row) {
          if (section == 0) {
            return verticalTextRow(section, row);
          } else if (section == 1) {
            return verticalCircleRow(section, row);
          } else if (section == 2) {
            return verticalMixtureRow(section, row);
          } else if (section == 3) {
            return horizontalTextRowView(section, row);
          } else if (section == 4) {
            return horizontalCircleRowView(section, row);
          } else {
            return horizontalMixtureRowView(section, row);
          }
        },
      ),
    );
  }
}
