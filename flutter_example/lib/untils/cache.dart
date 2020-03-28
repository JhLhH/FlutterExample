import 'dart:io';

import 'package:cache/cache_until.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CachePage extends StatefulWidget {
  @override
  _CachePageState createState() => _CachePageState();
}

class _CachePageState extends State<CachePage> {
  String _allSpace;
  String _remainingSpace;
  String _systemCache;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSpace();
    getSystemCache();
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
      _allSpace = aa;
      _remainingSpace = bb;
    });
  }

  void getSystemCache() async {
    String cc;
    if (Platform.isIOS) {
      Directory directory = await getTemporaryDirectory();
      cc = await Cache.systemCache(path: directory.path);
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
                  Text('总空间:$_allSpace'),
                  Text('可用空间:$_remainingSpace'),
                  Text('缓存大小:$_systemCache'),
                  RaisedButton(
                    child: Text("清理缓存"),
                    onPressed: () async {
                      bool isClean;
                      if (Platform.isIOS) {
                        Directory directory = await getTemporaryDirectory();
                        isClean = await Cache.clearCache(path: directory.path);
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
