import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:native_camera/native_camera.dart';
import 'dart:convert' as convert;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {


  Uint8List _uint8list = Uint8List(1);

  @override
  void initState() {
    super.initState();
  }

  void openCamera() async {
    Map<String, dynamic> map = await NativeCamera.openCamera();
    print(map["imagePath"].toString());
    print(map["videoPath"].toString());
    base642Image(map["imageBase64"]);
  }

  void base642Image(String base64Txt) async {
    Uint8List list =  convert.base64.decode(base64Txt);
    setState(() {
      _uint8list = list;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gamera'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: openCamera, child: Text('打开摄像头')),
            Image.memory(_uint8list),
          ],
        ),
      ),
    );
  }
}
