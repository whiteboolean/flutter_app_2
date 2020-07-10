import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _isHide = false;

  //玩安卓客户端
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
            offstage: !_isHide, //是否隐藏
            child: new Center(
              child: CircularProgressIndicator(),
            ))
      ],
    );
  }
}
