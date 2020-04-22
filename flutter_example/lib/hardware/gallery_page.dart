import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:native_gallery/native_gallery.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int maxSelectCount = 0;
  bool isSort = false;
  bool allowSelectImage = false;
  bool allowSelectVideo = false;
  bool allowSelectOriginal = false;
  bool allowEditImage = false;
  bool allowEditVideo = false;
  bool canTakePicture = false;
  bool allowChoosePhotoAndVideo = false;
  int maxEditVideoTime = 0;
  int maxVideoDuration = 0;
  IOSExportVideoType iosExportVideoType;
  List<Widget> childs = [];

  @override
  void initState() {
    super.initState();
  }

  void openAlbum() async {
    Map<dynamic, dynamic> map = await NativeGallery.openAlbum(
      maxSelectCount: maxSelectCount,
      sortAscending: isSort,
      allowSelectImage: allowEditImage,
      allowSelectVideo: allowSelectVideo,
      allowSelectOriginal: allowSelectOriginal,
      allowEditImage: allowEditImage,
      allowEditVideo: allowEditVideo,
      canTakePicture: canTakePicture,
      allowChoosePhotoAndVideo: allowChoosePhotoAndVideo,
      maxEditVideoTime: maxEditVideoTime,
      maxVideoDuration: maxVideoDuration,
      iosExportVideoType: iosExportVideoType,
    );
    print(map);
    List<Widget> wids = [];
    List list = map["images"];
    list.forEach((element) async {
      Uint8List list = await base642Image(element);
      wids.add(SizedBox(
        width: 100,
        height: 100,
        child: Image.memory(list),
      ));
    });
    setState(() {
      childs = wids;
    });
  }

  Future<Uint8List> base642Image(String base64Txt) async {
    Uint8List list = convert.base64.decode(base64Txt);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gallery'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              hintText: '请输入选择照片数量',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (text) {
              maxSelectCount = int.parse(text);
            },
          ),
          Wrap(
            children: <Widget>[
              CustomCheckBox(
                describeText: '升序',
                selectCallback: (select) {
                  isSort = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否允许选择图片',
                selectCallback: (select) {
                  allowSelectImage = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否允许选择视频',
                selectCallback: (select) {
                  allowSelectVideo = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否允许选择原图',
                selectCallback: (select) {
                  allowSelectOriginal = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否可以编辑图片',
                selectCallback: (select) {
                  allowEditImage = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否可以编辑视频',
                selectCallback: (select) {
                  allowEditVideo = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否可以拍照',
                selectCallback: (select) {
                  canTakePicture = select;
                },
              ),
              CustomCheckBox(
                describeText: '是否可以同时选中图片和视频',
                selectCallback: (select) {
                  allowChoosePhotoAndVideo = select;
                },
              ),
            ],
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              hintText: '编辑视频时最大裁剪时间',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (text) {
              maxEditVideoTime = int.parse(text);
            },
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              hintText: '允许选择视频的最大时长',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (text) {
              maxVideoDuration = int.parse(text);
            },
          ),
          Text('导出视频类型'),
          Wrap(
            children: <Widget>[
              CustomCheckBox(
                describeText: 'mov',
                selectCallback: (select) {
                  iosExportVideoType = IOSExportVideoType.mov;
                },
              ),
              CustomCheckBox(
                describeText: 'mp4',
                selectCallback: (select) {
                  iosExportVideoType = IOSExportVideoType.mp4;
                },
              ),
            ],
          ),
          RaisedButton(
            onPressed: openAlbum,
            child: Text('打开相册'),
          ),
          Wrap(
            children: childs,
          ),
        ],
      ),
    );
  }
}

typedef SelectCallback = Function(bool select);

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({this.selectCallback, this.describeText});
  SelectCallback selectCallback;
  String describeText;

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isSelct = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
              value: isSelct,
              onChanged: (select) {
                setState(() {
                  isSelct = select;
                });
              }),
          Text(widget.describeText),
        ],
      ),
    );
  }
}
