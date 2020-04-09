import 'package:dialog/dialog.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {

  bool _loading = false;

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
                  child: Text("CustomDialog"),
                  onPressed: () {
                    showCustomDialog(
                        context: context,
                        gravity: 0,
                        child: Text("showCustomDialog"));
                  },
                ),
                RaisedButton(
                  child: Text("showBottomCustomDialog"),
                  onPressed: () {
                    showBottomCustomDialog(
                        context: context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("随便写的"),
                            Text("随便"),
                            Text("自定义内容"),
                          ],
                        ));
                  },
                ),
                RaisedButton(
                  child: Text("showBottomListDialog"),
                  onPressed: () {
                    showBottomListDialog(
                        context: context,
                        title: '我是标题',
                        content: '我是内容',
                        action: ['第一项', '第二项', '第三项'],
                        onItemCallBack: (index) {
                          Navigator.pop(context);
                        });
                  },
                ),
                RaisedButton(
                  child: Text("SimpleListDialog"),
                  onPressed: () {
                    showListDialog(
                        context: context,
                        title: '我是标题',
                        content: '我是内容',
                        action: ['第一项', '第二项', '第三项'],
                        onItemCallBack: (index) {
                          Navigator.pop(context);
                        });
                  },
                ),
                RaisedButton(
                  child: Text("TwoButtonDialog"),
                  onPressed: () {
                    showNormalDialog(
                        context: context,
                        title: '我是标题',
                        action: ['取消', '确认'],
                        onItemCallBack: (index) {
                          Navigator.pop(context);
                        });
                  },
                ),
                RaisedButton(
                  child: Text("NormalDialog"),
                  onPressed: () {
                    showNormalDialog(
                        context: context,
                        title: '我是标题',
                        action: ['知道了'],
                        onItemCallBack: (index) {
                          Navigator.pop(context);
                        });
                  },
                ),
                RaisedButton(
                  child: Text("LoadingDialog"),
                  onPressed: () {

                  },
                ),
              ],
            ),
      ),
    );
  }
}
