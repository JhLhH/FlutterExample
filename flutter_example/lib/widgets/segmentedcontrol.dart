import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatefulWidget {
  @override
  _CustomSegmentedControlState createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExtensionData'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[_getPopupMenButton()],
      ),
      body: Column(
        children: <Widget>[
          CupertinoSegmentedControl(children: null, onValueChanged: null)
        ],
      ),
    );
  }

  _getPopupMenButton() {
    return PopupMenuButton<int>(onSelected: (int index) {
      if (index == 1) {
        Navigator.of(context).pushNamed('doc',
            arguments:
                'https://github.com/wya-team/flutter_wya/blob/master/flutter_untils/cache/lib/cache_until.dart');
      } else if (index == 2) {
        Navigator.of(context).pushNamed('doc',
            arguments:
                'https://github.com/wya-team/flutter_wya/blob/master/flutter_untils/cache/lib/cache_until.dart');
      }
    }, itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          child: Text('查看文档'),
          value: 1,
        ),
        PopupMenuItem(
          child: Text('查看Demo'),
          value: 2,
        ),
      ];
    });
  }
}
