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
  // 'file:///var/mobile/Containers/Data/Application/17B4B41E-29AE-4972-82D3-321FB905789E/Library/Caches/sound.aac'
  String path = '/Users/lishihang/Desktop/sound.aac';
  void startRecord() async {
    String result = await flutterSound.startRecorder(codec: t_CODEC.CODEC_AAC,);
    print('startRecorder: $result');
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
    print('aaa');
    String result = await flutterSound.stopRecorder();
    print('stopRecorder: $result');

    if (_recorderSubscription != null) {
      _recorderSubscription.cancel();
      _recorderSubscription = null;
    }
  }

  void startPlay() async {
    bool isSuccess = await NativeRecord.recordPlay(
        path,
      volume: 0.5,
      speed: 0.5,
      numberOfLoops: 1,
      currentTime: 0,
    );
    print('isSuccess==$isSuccess');
  }

  void reuseAudio() async {
    await NativeRecord.recordPause();
  }

  void stopAudio() async {
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
          RaisedButton(onPressed: startRecord, child: Text('开始录音')),
          RaisedButton(onPressed: stopRecord, child: Text('结束录音')),
          Text('录音的路径是：$path'),
          RaisedButton(onPressed: startPlay, child: Text('开始播放')),
          RaisedButton(onPressed: reuseAudio, child: Text('暂停播放')),
          RaisedButton(onPressed: stopAudio, child: Text('结束播放')),
        ],
      ),
    );
  }
}
