import 'package:cache/cache_until.dart';
import 'package:flutter/material.dart';

class CachePage extends StatefulWidget {
  @override
  _CachePageState createState() => _CachePageState();
}

class _CachePageState extends State<CachePage> {
  String allSpace;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getAllSpace();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('sss');
  }

  void getAllSpace() async {
    String aa = await Cache.deviceCacheSpace;
    setState(() {
      allSpace = aa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String text){
              if(text == '1'){
                print('a');
              } else if (text == '2'){
                print('b');
              }
            },
              itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text('查看文档'), value: '1',),
              PopupMenuItem(child: Text('查看Demo'), value: '2',),
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
                children: <Widget>[
                  Text('总空间:$allSpace'),
                  Text('可用空间:'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
