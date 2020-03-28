import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterexample/widgets/table_model_entity.dart';
import 'package:tableview/tableview.dart';

class TableModel {
  String title;
  List<TableRowModel> rowModel;
  bool isShow;
  TableModel(this.title, this.rowModel, this.isShow);
}

class TableRowModel {
  String title;
  TableRowModel(this.title);
}

class TableViewDemo extends StatefulWidget {
  @override
  _TableViewDemoState createState() => _TableViewDemoState();
}

class _TableViewDemoState extends State<TableViewDemo> {
  TableModelEntity _entity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    loadData();
  }

  void loadData() async {
    String data = await rootBundle.loadString('resource/a.json');
//    print(data);

//    print(_entity);
    setState(() {
      _entity = TableModelEntity.fromJson(json.decode(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableView(
          tableHeaderView: Image.asset('images/a.jpg'),
          tableFooterView: Text('ddd'),
          sectionNumber: _entity.xList.length,
          numberRowOfSection: (BuildContext context, int index) {
            TableModelList list = _entity.xList[index];
            return list.persons.length;
          },
          sectionHeaderView: (BuildContext context, int index) {
            return Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_right),
                  Text('aaa'),
                ],
              ),
            );
          },
          sectionFooterView: (BuildContext context, int index) {
            return Text('区尾');
          },
          rowView: (BuildContext context, int section, int row) {
            return InkWell(
              child: Text('aaa'),
            );
          }),
    );
  }
}
