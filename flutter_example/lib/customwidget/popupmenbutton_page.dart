import 'package:flutter/material.dart';

class PopupMenButtonPage extends StatefulWidget {
  List<String> titles;

  List<IconData> icons;
  List<Image> images;
  List<String> urls;

  PopupMenButtonPage({this.titles, this.icons, this.images, this.urls});

  @override
  _PopupMenButtonPageState createState() => _PopupMenButtonPageState();
}

class _PopupMenButtonPageState extends State<PopupMenButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return PopupMenuButton<int>(onSelected: (int index) {
        if (widget.urls.length == 0 || widget.urls == null) return;
        Navigator.of(context).pushNamed('doc', arguments: widget.urls[index]);
      }, itemBuilder: (BuildContext context) {
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
