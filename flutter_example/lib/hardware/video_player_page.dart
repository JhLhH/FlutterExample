import 'package:flutter/material.dart';
import 'package:native_video_player/video/video_player_UI.dart';
class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VidePlayer'),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: VideoPlayerUI.network(
          url: 'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4',
          title: '《驯龙高手》',
        ),
      ),
    );
  }
}
