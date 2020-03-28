import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopupmenButtonPage extends StatefulWidget {
  List<String> titles = ['查看文档','查看Demo'];
  List<IconData> icons;
  List<Image> images;
  List<String> urls;



  PopupmenButtonPage({this.icons, this.images, this.urls});

  @override
  _PopupmenButtonPageState createState() => _PopupmenButtonPageState();
}

class _PopupmenButtonPageState extends State<PopupmenButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return PopupMenuButton<int>(
          onSelected: (int index) {
        if (widget.urls.length == 0 || widget.urls == null) return;
        Navigator.of(context).pushNamed('doc', arguments: widget.urls[index]);
      },
          itemBuilder: (BuildContext context) {
        return _getPopupMenuItems();
      });
    });
  }

   _getPopupMenuItems() {
    List<PopupMenuEntry<int>> items = [];
    widget.titles.forEach((title) {
      items.add(_getPopupMenuItem(title));
    });
    return items;
  }

   _getPopupMenuItem(String title) {
    return PopupMenuItem(
      child: Text(title),
      value: widget.titles.indexOf(title),
    );
  }
}
