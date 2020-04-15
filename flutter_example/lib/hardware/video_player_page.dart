import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
import 'package:native_video_player/video_player_widget/video_player_UI.dart';
class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  bool _isShowAppBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isShowAppBar ? AppBar(
        title: Text('VidePlayer'),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenButtonPage(
            titles: ['查看文档'],
            urls: ['https://github.com/wya-team/flutter_wya/blob/master/flutter_hardware/native_video_player/README.md'],
          ),
        ],
      ): null,
      body: Column(
        children: [
          Container(
            child: VideoPlayerUI.network(
              screenSwitching: (value){
                setState(() {
                  _isShowAppBar = value;
                });
              },
              url: 'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4',
              title: '《驯龙高手》',
              width: double.infinity,
              height: 180,
            ),
          )
        ],
      )
    );
  }
}
