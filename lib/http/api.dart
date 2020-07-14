import 'package:flutterapp2/http/http_manager.dart';

class Api {
  static const String baseUrl = "http://www.wanandroid.com/";
  static const ARTICLE_LIST = "article/list/";

  static const String BANNER = "banner/json";

  static getArticle(int page) async {
    return HttpManager.getInstance().request("$ARTICLE_LIST$page/json");
  }

  static getBanner() async {
    return await HttpManager.getInstance().request(BANNER);
  }
}
