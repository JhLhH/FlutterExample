import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/gridview_page.dart';

class HardwarePage extends StatefulWidget {
  @override
  _HardwarePageState createState() => _HardwarePageState();
}

class _HardwarePageState extends State<HardwarePage> {
  List<String> titles = [
    'Permissions',
    'DeviceInfo',
    'Record',
    'Camera',
    'Gallery',
    'VideoPlayer'
  ];

  List<IconData> iconDatas = [
    Icons.lock,
    Icons.perm_device_information,
    Icons.record_voice_over,
    Icons.photo_camera,
    Icons.perm_media,
    Icons.video_library,
  ];

  Map<String, String> routeNames = {
    'Record':'record',
    'DeviceInfo':'DeviceInfo',
    'Permissions':'PermissionPage',
    'Gallery':'gallery'
  };

  @override
  Widget build(BuildContext context) {
    return GridViewPage(
      titles: titles,
      iconDatas: iconDatas,
      routeNames: routeNames,
    );
  }
}
