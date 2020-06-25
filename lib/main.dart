
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'full_screenimagepage.dart';


/**
 * 创建人：xuqing
 * 创建时间：2020年6月26日04:00:19
 * 类说明：瀑布流主页逻辑实现
 *
 *
 *
 */



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '瀑布流'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List imgList = [
    "http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png",
    "http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png",
    "http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png",
    "http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png",
    "http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png",
    "http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    'https://picsum.photos/id/101/548/338',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569842561051&di=45c181341a1420ca1a9543ca67b89086&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201504%2F17%2F20150417212547_VMvrj.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570437233&di=9239dbc3237f1d21955b50e34d76c9d5&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: imgList.length,
        itemBuilder: (context, i) {
          String imgPath = imgList[i];
          return new Material(
            elevation: 8.0,
            borderRadius: new BorderRadius.all(
              new Radius.circular(8.0),
            ),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) {
                       return new FullScreenImagePage(imageurl: imgPath);
                    },
                  ),
                );
              },
              child: new Hero(
                tag: imgPath,
                child: CachedNetworkImage(
                  imageUrl: imgPath,
                  fit: BoxFit.fitWidth,
              /*    placeholder: (context, url) =>
                      Image.asset('assets/wallfy.png'),*/
                ),
              ),
            ),
          );
        },
      //  staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index == 0 ? 2.5 : 3),    //
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}