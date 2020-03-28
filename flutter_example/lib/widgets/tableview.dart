import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterexample/widgets/table_model_entity.dart';
import 'package:tableview/tableview.dart';

class TableViewDemo extends StatefulWidget {
  @override
  _TableViewDemoState createState() => _TableViewDemoState();
}

class _TableViewDemoState extends State<TableViewDemo> {
  TableModelEntity _entity = TableModelEntity(
    xList: [],
  );

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
    TableModelEntity entity = TableModelEntity.fromJson(json.decode(data));
    setState(() {
      _entity = entity;
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
                  Text('${_entity.xList[index].name}'),
                ],
              ),
            );
          },
          rowView: (BuildContext context, int section, int row) {
            TableModelList list = _entity.xList[section];
            TableModelListPerson person = list.persons[row];
            return InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(person.url),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('官方名称:${person.officialName}'),
                          Text('名字:${person.name}'),
                          Text('网友戏称:${person.nickName}'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('人生格言：${person.saying}'),
                        Row(
                          children: <Widget>[
                            Text('战力值：'),
                            SizedBox(
                              width: 250,
                              height: 5,
                              child: LinearProgressIndicator(
                                value: person.powerValue / 10000,
                                backgroundColor: Colors.blue,
                                valueColor: AlwaysStoppedAnimation(Colors.red),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
