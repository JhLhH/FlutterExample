import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.trip.com/html5'];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebView(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewReference = FlutterWebviewPlugin();

  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  /// 是否返回
  bool exiting = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webViewReference.close();

    /// url变化监听
    _onUrlChanged = webViewReference.onUrlChanged.listen((String url) {});

    _isToMain(String url) {
      bool contain = false;
      for (final value in CATCH_URLS) {
        if (url?.endsWith(value) ?? false) {
          contain = true;
          break;
        }
      }
      return contain;
    }

    /// 页面变化的监听
    _onStateChanged =
        webViewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              webViewReference.launch(widget.url); // 重新打开当前页面
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;

        default:
          break;
      }
    });

    /// 链接打开错误的监听
    _onHttpError =
        webViewReference.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewReference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusbarColorStr = widget.statusBarColor ?? 'fffffff';

    Color backButtonColor;

    if (statusbarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          /// 一个颜色值是八位：Color(int类型)
          /// 0xff代表alpha,statusbarColorStr是六位代表的是RGB
          _appbar(
              Color(int.parse('0xff' + statusbarColorStr)), backButtonColor),
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            // 缩放
            withLocalStorage: true,
            //启用缓存
            hidden: true,
            // 加载完成前隐藏
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text('Waiting...'),
              ),
            ), // 加载前的显示
          ))
        ],
      ),
    );
  }

  _appbar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    } else {
      return Container(
        // 为了让组件撑满全屏
        padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
        color: backgroundColor,
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.close,
                    color: backButtonColor,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title ?? '',
                    style: TextStyle(color: backButtonColor, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
