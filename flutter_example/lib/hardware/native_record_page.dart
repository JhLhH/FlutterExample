import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:native_record/native_record.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  FlutterSound flutterSound = FlutterSound();
  StreamSubscription _recorderSubscription;
  String path = '这里显示录音的音频路径';
  bool canDispose = true;
  void startRecord() async {
    setState(() {
      canDispose = false;
    });
    String result = await flutterSound.startRecorder(
//      codec: t_CODEC.CODEC_AAC,
    );
//    _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
//      DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
//      String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
//      print('txt==$txt');
//    });
    setState(() {
      path = result;
    });
  }

  void stopRecord() async {
    setState(() {
      canDispose = true;
    });
    String result = await flutterSound.stopRecorder();
    print('stopRecorder: $result');

    if (_recorderSubscription != null) {
      _recorderSubscription.cancel();
      _recorderSubscription = null;
    }
  }

  void startPlay() async {
    setState(() {
      canDispose = false;
    });
    bool isSuccess = await NativeRecord.recordPlay(
      path,
      volume: 0.5,
      speed: 2.0,
      numberOfLoops: 1,
      currentTime: 0,
    );
    print('isSuccess==$isSuccess');
  }

  void reuseAudio() async {
    setState(() {
      canDispose = true;
    });
    await NativeRecord.recordPause();
  }

  void resumeAudio() async {
    setState(() {
      canDispose = false;
    });
    await NativeRecord.recordResume();
  }

  void stopAudio() async {
    setState(() {
      canDispose = true;
    });
    await NativeRecord.recordStop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterSound.stopRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record'),
      ),
      body: Column(
        children: <Widget>[
          ImagesAnim(
            [
              Image(image: AssetImage('images/voice_volume_1.png')),
              Image(image: AssetImage('images/voice_volume_2.png')),
              Image(image: AssetImage('images/voice_volume_3.png')),
              Image(image: AssetImage('images/voice_volume_4.png')),
              Image(image: AssetImage('images/voice_volume_5.png')),
              Image(image: AssetImage('images/voice_volume_6.png')),
              Image(image: AssetImage('images/voice_volume_7.png'))
            ],
            100,
            100,
            Colors.black,
            disposed: canDispose,
          ),
          RaisedButton(onPressed: startRecord, child: Text('开始录音')),
          RaisedButton(onPressed: stopRecord, child: Text('结束录音')),
          Text('录音的路径是：$path'),
          RaisedButton(onPressed: startPlay, child: Text('开始播放')),
          RaisedButton(onPressed: reuseAudio, child: Text('暂停播放')),
          RaisedButton(onPressed: resumeAudio, child: Text('继续播放')),
          RaisedButton(onPressed: stopAudio, child: Text('结束播放')),
        ],
      ),
    );
  }
}

class ImagesAnim extends StatefulWidget {
  final List<Image> imageCaches;
  final double width;
  final double height;
  final Color backColor;
  bool disposed = false;
  ImagesAnim(this.imageCaches, this.width, this.height, this.backColor,
      {Key key, this.disposed})
      : assert(imageCaches != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImagesAnimState();
  }
}

class ImagesAnimState extends State<ImagesAnim> {
  Duration _duration;
  int _imageIndex;
  List<Widget> _containers = [];

  @override
  void initState() {
    super.initState();
    _duration = Duration(milliseconds: 300);
    _imageIndex = 0;

    widget.imageCaches.forEach((element) {
      _containers.add(Container(
        height: widget.height,
        width: widget.width,
        child: element,
        color: widget.backColor,
      ));
    });
    _updateImage();
  }

  void _updateImage() {
    if (widget.disposed || widget.imageCaches.isEmpty) {
      return;
    }

    setState(() {
      _imageIndex++;
      if (_imageIndex == widget.imageCaches.length - 1) {
        _imageIndex = 0;
      }
    });
    Future.delayed(_duration, () {
      _updateImage();
    });
  }

  @override
  void didUpdateWidget(ImagesAnim oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _updateImage();
  }

  @override
  void dispose() {
    super.dispose();
    widget.disposed = true;
    widget.imageCaches.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _imageIndex,
      children: _containers,
    );
  }
}
