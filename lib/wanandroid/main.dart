import 'package:flutter/material.dart';
import 'package:flutterapp2/wanandroid/ArticlePage.dart';

//1.main方法，执行runApp
//2.初始化App继承自StatelessWidget

void main() => runApp(new ArticleApp());

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "玩安卓客户端",
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        body: ArticlePage(),
      ),
    );
  }
}
