import 'dart:io';

import 'package:cache/cache_until.dart';
import 'package:flutter/material.dart';

class CachePage extends StatefulWidget {
  @override
  _CachePageState createState() => _CachePageState();
}

class _CachePageState extends State<CachePage> {
  String allSpace;
  String remainingSpace;
  String _systemCache;
  bool _isClean;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSpace();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    getAllSpace();
    getSystemCache();
  }

  void getAllSpace() async {
    String aa = await Cache.deviceCacheSpace;
    String bb = await Cache.availableSpace;
    print(bb);
    setState(() {
      allSpace = aa;
      remainingSpace = bb;
    });
  }

  void getSystemCache() async {
    String cc;
    if (Platform.isIOS) {
//      cc = await Cache.systemCache("");
    } else if (Platform.isAndroid) {
      cc = await Cache.systemCache();
    }
    setState(() {
      _systemCache = cc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache'),
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (String text) {
            if (text == '1') {
              Navigator.of(context).pushNamed('doc',
                  arguments:
                      'https://github.com/wya-team/flutter_wya/blob/master/flutter_untils/cache/lib/cache_until.dart');
            } else if (text == '2') {
              Navigator.of(context)
                  .pushNamed('doc', arguments: 'https://www.baidu.com');
            }
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('查看文档'),
                value: '1',
              ),
              PopupMenuItem(
                child: Text('查看Demo'),
                value: '2',
              ),
            ];
          }),
        ],
      ),
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('总空间:$allSpace'),
                  Text('可用空间:$remainingSpace'),
                  Text('缓存大小:$_systemCache'),
                  RaisedButton(
                    child: Text("清理缓存"),
                    onPressed: () async {
                      bool isClean;
                      if (Platform.isIOS) {
//                        isClean = await Cache.clearCache("");
                      } else if (Platform.isAndroid) {
                        isClean = await Cache.clearCache();
                      }
                      setState(() {
                        if (isClean) {
                          _systemCache = '0B';
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
