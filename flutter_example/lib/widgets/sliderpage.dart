import 'package:flutter/material.dart';
import 'package:flutterexample/customwidget/popupmenbutton_page.dart';
import 'package:slider/slider.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EEF9),
      appBar: AppBar(
        title: Text('SegmentedControl'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenButtonPage(
            titles: ['查看文档'],
            urls: ['https://github.com/wya-team/flutter_wya/blob/master/flutter_widgets/slider/README.md'],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: _getNormalSlider(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: _getSlider(
                  leftChild: Text('1'),
                  rightChild: Text('100'),
                  selectedValue: 30,
                  value: 11),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: _getSlider(
                    leftChild: Icon(
                      Icons.volume_mute,
                      size: 20,
                      color: Colors.grey,
                    ),
                    rightChild:
                        Icon(Icons.volume_up, size: 20, color: Colors.grey),
                    selectedValue: 60,
                    value: 7))
          ],
        ),
      ),
    );
  }

  _getNormalSlider() {
    return CustomSlider(
      width: 100,
      min: 0,
      max: 100,
      selectedValue: 40,
      valueChanged: (value) {
        print('当前进度$value%');
      },
    );
  }

  _getSlider(
      {double selectedValue,
      Widget leftChild,
      Widget rightChild,
      double value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: value),
          child: leftChild,
        ),
        CustomSlider(
          width: 100,
          min: 0,
          max: 100,
          selectedValue: selectedValue ?? 0,
          valueChanged: (value) {
            print('当前进度$value%');
          },
        ),
        Container(
          padding: EdgeInsets.only(left: value),
          child: rightChild,
        ),
      ],
    );
  }
}
