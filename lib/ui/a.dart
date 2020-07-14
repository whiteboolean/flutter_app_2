import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final itemData;

  const ArticleItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    //时间与作者
    Row author = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
              TextSpan(children: [
            TextSpan(text: "作者:"),
            TextSpan(
                text: itemData['author'] ?? "Ray",
                style: TextStyle(color: Theme.of(context).primaryColor))
          ])),
        ),
        Text(itemData['niceDate']??"2020-07-08") //时间
      ],
    );

    //标题
    Text title = Text(
      itemData['title'],
      style: TextStyle(fontSize: 16.0, color: Colors.black),
      textAlign: TextAlign.left,
    );

    //章节名
    Text chapterName = Text(
      itemData['chapterName'],
      style: TextStyle(color: Theme.of(context).primaryColor),
    );

    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: author,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5.0, 10.0, 5.0),
            child: title,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
            child: chapterName,
          )
        ],
      ),
    );
  }
}
