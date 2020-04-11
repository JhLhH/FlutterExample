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
      time: 2,
    );
  }

  void showWebColoredToast() {
    CustomToast.showToast(
      "This is Colored Toast with android duration of 5 Sec",
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
        time: 1,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Toast'),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Long Toast'), onPressed: showLongToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Short Toast'),
                  onPressed: showShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Center Short Toast'),
                  onPressed: showCenterShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Top Short Toast'),
                  onPressed: showTopShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Colored Toast'),
                  onPressed: showColoredToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show  Web Colored Toast'),
                  onPressed: showWebColoredToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                child: new Text('Cancel Toasts'),
                onPressed: cancelToast,
              ),
            ),
          ],
        ));
  }
}
