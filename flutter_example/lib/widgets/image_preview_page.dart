import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';

class ImagePreviewPage extends StatefulWidget {
  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  void pushRouteWithContext(BuildContext context, int index) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ImageP(
        [
          'http://a3.att.hudong.com/14/75/01300000164186121366756803686.jpg',
          'http://b2-q.mafengwo.net/s5/M00/91/06/wKgB3FH_RVuATULaAAH7UzpKp6043.jpeg',
          'http://a0.att.hudong.com/64/76/20300001349415131407760417677.jpg'
        ],
        models: [
          ImagePreviewModel(
            originalImageUrl:
//                'http://a1.att.hudong.com/68/58/01200000032867136324584203261.jpg',
//            'http://file02.16sucai.com/d/file/2014/0829/372edfeb74c3119b666237bd4af92be5.jpg',
//            'http://file02.16sucai.com/d/file/2014/1028/f445fe013d861d9e99fd70a0734efd8a.jpg',
//            'http://img1.imgtn.bdimg.com/it/u=338573938,2077029705&fm=26&gp=0.jpg',
                'http://pic.3h3.com/up/2015-1/20151117170929097384.jpg',
            imageSize: '10MB',
          ),
          ImagePreviewModel(
            originalImageUrl:
                'http://b1-q.mafengwo.net/s5/M00/E9/BC/wKgB3FICHtCAaAeRAAgdyp5Iiw455.jpeg',
            imageSize: '100KB',
          ),
          ImagePreviewModel(
            originalImageUrl:
                'http://a0.att.hudong.com/27/10/01300000324235124757108108752.jpg',
            imageSize: '20MB',
          ),
        ],
        selectIndex: index,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ImagePreview'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widget
              ),
          children: <Widget>[
            InkWell(
              onTap: () {
                pushRouteWithContext(context, 0);
              },
              child: Image(
                image: AssetImage('images/image_1.png'),
              ),
            ),
            InkWell(
              onTap: () {
                pushRouteWithContext(context, 1);
              },
              child: Image(
                image: AssetImage('images/image_2.png'),
              ),
            ),
            InkWell(
              onTap: () {
                pushRouteWithContext(context, 2);
              },
              child: Image(
                image: AssetImage('images/image_4.png'),
              ),
            )
          ],
        ));
  }
}

class ImageP extends StatelessWidget {
  ImageP(
    this.imageNames, {
    this.models,
    this.selectIndex,
  });

  int selectIndex;
  List<String> imageNames;
  List<ImagePreviewModel> models;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePreview(
        selectIndex: this.selectIndex,
        pageControlStyle: PageControlStyle.none,
        provider: (BuildContext context, int index) {
//          return AssetImage(this.imageNames[index]);
          return NetworkImage(this.imageNames[index]);
        },
        modelCallback: this.models != null
            ? (int index) {
                return this.models[index];
              }
            : null,
        itemCount: this.imageNames.length,
      ),
    );
  }
}
