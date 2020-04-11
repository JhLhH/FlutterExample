import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastPage extends StatefulWidget {
  @override
  _ToastPageState createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  initState() {
    super.initState();
  }

  void showLongToast() {
    CustomToast.showToast(
      "This is Long Toast",
      time: 3,
    );
  }

  void showColoredToast() {
    CustomToast.showToast(
        "This is Colored Toast with android duration of 5 Sec",
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void showShortToast() {
    CustomToast.showToast(
      "This is Short Toast",
    );
  }

  void showTopShortToast() {
    CustomToast.showToast(
      "This is Top Short Toast",
      gravity: ToastGravity.TOP,
    );
  }

  void showCenterShortToast() {
    CustomToast.showToast(
      "This is Center Short Toast",
      gravity: ToastGravity.CENTER,
    );
  }

  void cancelToast() {
    CustomToast.cancelToast();
  }

  void showLoading() {
    CustomToast.showLoading(
        msg: '加载数据中...', cancelable: true, canceledOnTouchOutside: true);
  }

  void showSuccess() {
    CustomToast.showLoading(
        cancelable: true, canceledOnTouchOutside: true, status: 1);
  }

  void showFail() {
    CustomToast.showLoading(
        cancelable: true, canceledOnTouchOutside: true, status: -1);
  }

  void showWarn() {
    CustomToast.showLoading(
        cancelable: true, canceledOnTouchOutside: true, status: -2);
  }

  void cancelLoading() {
    CustomToast.cancelLoading();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Toast'),
        ),
        body: GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    child: new Text('Show Long Toast'),
                    onPressed: showLongToast),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    child: new Text('Show Short Toast'),
                    onPressed: showShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    child: new Text('Show Center Short Toast'),
                    onPressed: showCenterShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    child: new Text('Show Top Short Toast'),
                    onPressed: showTopShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    child: new Text('Show Colored Toast'),
                    onPressed: showColoredToast),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Cancel Toasts'),
                  onPressed: cancelToast,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Show Loading'),
                  onPressed: showLoading,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Show Success'),
                  onPressed: showSuccess,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Show Fail'),
                  onPressed: showFail,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Show Warn'),
                  onPressed: showWarn,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: new Text('Cancel Loading'),
                  onPressed: cancelLoading,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
