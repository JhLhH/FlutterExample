import 'dart:io';

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:fluttertoast/fluttertoast.dart';

class PermissionHandlerPage extends StatelessWidget {
  Map<String, dynamic> _readAndroidBuildData = {
    '通讯录权限': PermissionGroup.contacts,
    '麦克风权限': PermissionGroup.microphone,
    '存储权限': PermissionGroup.storage,
    '相机权限': PermissionGroup.camera,
  };

  Map<String, dynamic> _readIosDeviceInfo = {
    '通讯录权限': PermissionGroup.contacts,
    '麦克风权限': PermissionGroup.microphone,
    '相机权限': PermissionGroup.camera,
    '相册权限': PermissionGroup.photos,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Permission'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: Platform.isAndroid
                  ? _getItems(_readAndroidBuildData)
                  : _getItems(_readIosDeviceInfo)),
        ));
  }

  _getItems(Map map) {
    List<Widget> items = [];
    map.keys.forEach((key) {
      items.add(_getItem(key, map[key]));
    });
    return items;
  }

  _getItem(String key, PermissionGroup permissionGroup) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
          onPressed: () {
            requestPermission(permissionGroup, key);
          },
          child: Text(key)
      ),
    );
  }

  Future requestPermission(PermissionGroup permissionGroup, String key) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([permissionGroup]);
    // 申请结果
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(permissionGroup);

    if (permission == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "$key申请通过");
    } else {
      Fluttertoast.showToast(msg: "$key申请被拒绝");
    }
  }
}
