import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/dialog_page.dart';
import 'package:flutterexample/customwidget/toast_page.dart';
import 'package:flutterexample/hardware/native_record_page.dart';
import 'package:flutterexample/widgets/round_checkbox_page.dart';
import 'package:flutterexample/untils/cache.dart';
import 'package:flutterexample/docs/doc.dart';
import 'package:flutterexample/untils/date.dart';
import 'package:flutterexample/untils/extensiondata.dart';
import 'package:flutterexample/widgets/searchbar.dart';
import 'package:flutterexample/widgets/noticebarpage.dart';
import 'package:flutterexample/widgets/segmentedcontrol.dart';
import 'package:flutterexample/widgets/steppage.dart';
import 'package:flutterexample/widgets/tableview.dart';
import 'package:flutterexample/route/hardware_page.dart';
import 'package:flutterexample/route/untils_page.dart';
import 'package:flutterexample/route/widgets_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List titles = ['flutter_untils', 'flutter_widgets', 'flutter_hardware'];
  List nativeTitles = ['UntilsPage', 'WidgetsPage', 'HardwarePage'];
  int _currentIndex = 0;

  List<IconData> normalLeftIcons = [
    Icons.build,
    Icons.extension,
    Icons.android,
  ];
  var _body;

  void initData() {
    _body = IndexedStack(
      children: <Widget>[UntilsPage(), WidgetsPage(), HardwarePage()],
      index: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text(nativeTitles[_currentIndex]),
          ),
          body: _body,
          drawer: Builder(builder: (BuildContext context) {
            return Drawer(
              child: Container(
                padding: EdgeInsets.zero,
                child: ListView(
                  children: _items(context),
                ),
              ),
            );
          })),
      routes: <String, WidgetBuilder>{
        // 路由表注册
        'doc': (context) => Doc(ModalRoute.of(context).settings.arguments),
        'cache': (context) => CachePage(),
        'date': (context) => DatePage(),
        'ExtensionData': (context) => ExtensionDataPage(),
        'SegmentedControl':(context) => CustomSegmentedControl(),
        'dialog': (context) => DialogPage(),
        'toast': (context) => ToastPage(),
        'tableview': (context) => TableViewDemo(),
        'SearchBar':(context) => SearchBarPage(),
        'noticebar' : (context) => NoticeBarPage(),
        'checkbox' : (context) => RoundCheckBoxPage(),
        'record' : (context) => RecordPage(),
        'step': (context) => StepPage(),
      },
    );
  }

  Widget _drawerHeader(String title) {
    return DrawerHeader(
      child: Center(
        child: FlutterLogo(size: 100.0),
      ),
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  List<Widget> _items(BuildContext context) {
    List<Widget> items = [_drawerHeader('Flutter')];
    for (int i = 0; i < titles.length; i++) {
      items.add(_item(context, normalLeftIcons[i], titles[i], nativeTitles[i]));
      items.add(Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Divider(
          color: Colors.grey,
        ),
      ));
    }
    return items;
  }

  Widget _item(
    BuildContext context,
    IconData icon,
    String title,
    String routeName,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color:
            _currentIndex == titles.indexOf(title) ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: _currentIndex == titles.indexOf(title)
                ? Colors.blue
                : Colors.grey),
      ),
      onTap: () {
        setState(() {
          _currentIndex = titles.indexOf(title);
        });
        Navigator.pop(context);
      },
    );
  }
}
