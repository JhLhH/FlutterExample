import 'package:flutter/material.dart';
import 'package:noticebar/noticebar.dart';

class NoticeBarPage extends StatefulWidget {
  @override
  _NoticeBarPageState createState() => _NoticeBarPageState();
}

class _NoticeBarPageState extends State<NoticeBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoticeBar'),
      ),
      body: Column(
        children: <Widget>[
          NoticeBar(
            leftWidget: Icon(Icons.print),
              rightWidget: Icon(Icons.add),
              textList: ['解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
                '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
                '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
                '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
                '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机'],
            backgroundColor: Colors.white,
          ),
          NoticeBar(
            leftWidget: Icon(Icons.print),
            rightWidget: Icon(Icons.add),
            textList: ['解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
              '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
              '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
              '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机',
              '解决解决军军解决解决军手势军所的风格所时点击藕丝基调涉及到司机'],
            backgroundColor: Colors.white,
            reverse: true,
          ),
          NoticeBar(
            leftWidget: Icon(Icons.person),
            rightWidget: Icon(Icons.phone),
            textList: ['这个是横向滚动的数据源字数限制了没有也不清楚自己看看1',
              '这个是横向滚动的数据源字数限制了没有也不清楚自己看看2',
              ],
            backgroundColor: Colors.white,
          ),
          NoticeBar(
            leftWidget: Icon(Icons.person),
            rightWidget: Icon(Icons.phone),
            textList: ['这个是横向滚动的数据源字数限制了没有也不清楚自己看看1',
              '这个是横向滚动的数据源字数限制了没有也不清楚自己看看2',
            ],
            backgroundColor: Colors.white,
            reverse: true,
          ),
          NoticeBar(
            leftWidget: Icon(Icons.pages),
            rightWidget: Icon(Icons.pageview),
            textList: ['这个是纵向滚动的数据源没有也不清楚自己看看1',
              '这个是纵向滚动的数据源没有也不清楚自己看看2',
              '这个是纵向滚动的数据源没有也不清楚自己看看3',
              '这个是纵向滚动的数据源没有也不清楚自己看看4',
              '这个是纵向滚动的数据源没有也不清楚自己看看5'],
            backgroundColor: Colors.white,
            scrollDirection: Axis.vertical,
          ),
          NoticeBar(
            leftWidget: Icon(Icons.pages),
            rightWidget: Icon(Icons.pageview),
            textList: ['这个是纵向滚动的数据源没有也不清楚自己看看1',
              '这个是纵向滚动的数据源没有也不清楚自己看看2',
              '这个是纵向滚动的数据源没有也不清楚自己看看3',
              '这个是纵向滚动的数据源没有也不清楚自己看看4',
              '这个是纵向滚动的数据源没有也不清楚自己看看5'],
            backgroundColor: Colors.white,
            scrollDirection: Axis.vertical,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
