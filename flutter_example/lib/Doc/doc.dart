import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Doc extends StatelessWidget {
  String url;
  Doc(this.url);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Doc'),
      ),
        url: this.url,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: Text('文档正在获取中...'),
        ),
      ),
    );
  }
}
