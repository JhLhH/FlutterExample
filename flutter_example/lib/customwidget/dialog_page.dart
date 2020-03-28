import 'package:dialog/bottom_dialog.dart';
import 'package:dialog/dialog.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var list = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogExample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("LoadingDialog"),
              onPressed: () {
                showLoadingDialog(
                    context: context,
                    direction: Direction(
                      message: "加载中",
                      messageStyle: TextStyle(),
                      orientations: Orientations.Horizontal,
                      width: 120,
                      height: 120,
                    ));
              },
            ),
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () {
                showAlertDialog(
                    context: context,
                    title: Text("标题"),
                    content: Text("我是内容"),
                    semanticLabel: "AlertDialog扩展",
                    actions: <Widget>[
                      FlatButton(
                        child: Text("确认"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("取消"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]);
              },
            ),
            RaisedButton(
              child: Text("BottomDialog"),
              onPressed: () {
                showBottomDialog(
                  context: context,
                  title: Text("标题"),
                  content: Container(child: Text("我是内容")),
                  isScrollControlled: true,
                  actions: <Widget>[
                    FlatButton(
                      child: Text("确认"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ),
            RaisedButton(
              child: Text("CustomAlertDialog"),
              onPressed: () {
                showCustomAlertDialog(
                    context: context,
                    dialogBuilder: DialogBuilder(
                      simpleBuilder: SimpleBuilder(
                        title: Text("标题"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              for (var i in list)
                                InkWell(
                                  child: Text(i),
                                  onTap: () {
                                    print(i);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    confirmWidget: Text("确认"),
                    cancelWidget: Text("取消"),
                    onConfirmCallBack: () {
                      Navigator.pop(context);
                    },
                    onCancelCallBack: () {
                      Navigator.pop(context);
                    });
              },
            ),
            RaisedButton(
              child: Text("SimpleListDialog"),
              onPressed: () {
                showSimpleListDialog(
                    context: context,
                    simpleBuilder: SimpleBuilder(),
                    children: <Widget>[
                      for (var i in list) Text(i),
                    ],
                    onItemCallBack: (index) {
                      print(list[index]);
                    });
              },
            ),
            RaisedButton(
              child: Text("CustomDialog"),
              onPressed: () {
                showCustomDialog(
                    context: context,
                    gravity: 0,
                    child: Text("showCustomDialog"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
