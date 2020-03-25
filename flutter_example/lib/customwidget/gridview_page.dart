import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridViewPage extends StatefulWidget {

  /// 标题名字
  List<String> titles = [];

  /// 每个Item要展示的Icon
  List<IconData> iconDatas = [];

  /// 路由名字每一个Item对应跳转的界面路由
  List<String> routeNames = [];

  GridViewPage({@required this.titles, @required this.iconDatas, @required this.routeNames});

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: _getWidgetList(context),
    );
  }

  List<Widget> _getWidgetList(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < widget.titles.length; i++) {
      items.add(_getItemContainer(context, widget.titles[i], widget.iconDatas[i], _getRouteName(i)));
    }
    return items;
  }

  String _getRouteName(int index){
    if (widget.routeNames != null && widget.routeNames.length == widget.titles.length){
      return widget.routeNames[index];
    }
    return null;
  }

  Widget _getItemContainer(BuildContext context, String title, IconData icon, String routeName) {
    return GestureDetector(
      onTap: (){
        print('当前点击$title Item');
        if(routeName != null){
          Navigator.pushNamed(context, routeName);
        }else{
          print('未查找到该路由');
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.blue,
              size: 30.0,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}


