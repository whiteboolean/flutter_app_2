import 'package:flutter/material.dart';
import 'package:flutterapp2/http/api.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutterapp2/ui/a.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _isHide = false;
  ScrollController _controller = ScrollController();

  List articles = [];
  List banners = [];

  var curPage = 0;
  var totalCount = 0;

  @override
  void initState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && curPage < totalCount) {
        _getArticleList();
      }
    });
    _pullToRefresh();
  }

  //玩安卓客户端
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///正在加载
        Offstage(
            offstage: !_isHide, //是否隐藏
            child: new Center(
              child: CircularProgressIndicator(),
            )),

        ///内容
        Offstage(
          offstage: _isHide,
          child: RefreshIndicator(
              child: ListView.builder(
                itemCount: articles.length + 1,
                itemBuilder: (context, i) => _buildItem(i),
                controller: _controller,
              ),
              onRefresh: _pullToRefresh),
        ),
      ],
    );
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return ArticleItem(itemData);
  }

  Widget _bannerView() {
    List<Widget> list = banners.map((e) {
      return Image.network(e['imagePath'], fit: BoxFit.cover); //填充
    }).toList();
    return list.isNotEmpty
        ? BannerView(
            list,
            intervalDuration: const Duration(seconds: 3),
            autoRolling: true,
          )
        : null;
  }

  Future<void> _pullToRefresh() async {
    curPage = 0;
    Iterable<Future> futures = [_getArticleList(), _getBanner()];
    await Future.wait(futures);
    _isHide = false;
    setState(() {});
    return null;
  }

  _getArticleList([bool update = true]) async {
    //请求成功是map，失败是null
    var data = await Api.getArticle(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      ///文章总数
      totalCount = map['pageCount'];

      if (curPage == 0) {
        articles.addAll(datas);
      }

      if (update) {
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }
}
