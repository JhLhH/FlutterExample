import 'package:flutter/material.dart';
import 'package:tableview/tableview.dart';

class TableModel {
  String title;
  TableRowModel rowModel;
  bool isShow;
}

class TableRowModel {
  String title;

}

class TableViewDemo extends StatefulWidget {
  @override
  _TableViewDemoState createState() => _TableViewDemoState();
}

class _TableViewDemoState extends State<TableViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableView(
        tableHeaderView: Image.asset('images/a.jpg'),
          tableFooterView: Text('ddd'),
          sectionNumber: 3, 
          numberRowOfSection: (BuildContext context, int index){
            return 3;
          },
          sectionHeaderView: (BuildContext context, int index){
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
          sectionFooterView: (BuildContext context, int index){
            return Text('区尾');
          },
          rowView: (BuildContext context, int section, int row){
            return InkWell(
              child: Text('aaa'),
            );
          }
      ),
    );
  }
}
