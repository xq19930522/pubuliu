import 'package:flutter/material.dart';


/**
 *
 * 创建人：xuqing
 * 创建时间:2020年6月26日03:03:05
 * 类说明：图片详情页面
 *
 *
 *
 */

class FullScreenImagePage extends StatefulWidget {
  final String  imageurl;
  FullScreenImagePage({Key key,this.imageurl}) : super(key: key);

  @override
  _FullScreenImagePageState createState() {
    return _FullScreenImagePageState();
  }
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("图片详情页面"),
        centerTitle: true,
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Image.network(widget.imageurl, fit: BoxFit.fitWidth,),

      ),
    );


  }
}