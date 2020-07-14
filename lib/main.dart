import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp2/wanandroid/page_article.dart';
import 'package:toast/toast.dart';

void main() {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
    // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(PracticeApp());
}

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //脚手架
      appBar: AppBar(
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "玩安卓客户端",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          )),
      body: ArticlePage(),
    );
  }
}

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/firstPage': (BuildContext context) => FirstPage(),
        '/ArticleApp': (BuildContext context) => ArticleApp(),
        '/LayoutPage': (BuildContext context) => LayoutPage()
      },
      initialRoute: '/firstPage',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  var _selectedIndex = 0;
  var _pages;
  var _pageController = PageController();

  void initViews() {
    _pages = [FirstPageItem(), SecondPageItem(), ThirdPageItem()];
  }

  @override
  Widget build(BuildContext context) {
    initViews();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "控件",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
//          leading: FlutterLogo(colors: Colors.lightGreen,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Toast.show("点击了分享按钮", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("通讯录"),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.build), title: Text("设置"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (index) => _pageController.jumpToPage(index),
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ray神"),
                accountEmail: Text("YBA51@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text('Ray'),
                ),
              ),
              ListTile(
                onTap: () => Toast.show("邮件", context),
                leading: Icon(Icons.local_post_office),
                title: Text("邮件"),
              ),
              ListTile(
                  onTap: () => Toast.show("设置", context),
                  leading: Icon(Icons.settings),
                  title: Text("设置")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: () => Navigator.pushNamed(context, '/LayoutPage'),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LayoutPage())),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: _onItemTapped,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                print("s");
                return _pages[index];
              })),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

///第一个bottom页面
class FirstPageItem extends StatefulWidget {
  @override
  _FirstPageItemState createState() => _FirstPageItemState();
}

class _FirstPageItemState extends State<FirstPageItem> {
  static const platformChannel =
      const MethodChannel("com.example.platform_channel/dialog");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Material(
            color: Colors.blue,
            child: Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: TabBar(
                  labelStyle: TextStyle(fontSize: 16),
                  tabs: <Widget>[
                    Text(
                      "热点",
                    ),
                    Text(
                      "新闻",
                    ),
                    Text(
                      "体育",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.red,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleApp()));
                        },
                        child: Text("我是按钮"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "距离上面20dp",
                          style: TextStyle(
                              fontSize: 19,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.lightBlue),
                            child: Text("fdsafsd"),
                            padding: EdgeInsets.all(40.0),
                            margin: EdgeInsets.all(20.0),
                          )),
                      Container(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        margin: EdgeInsets.all(30),
                        padding: EdgeInsets.all(20),
                        child: RaisedButton(
                          onPressed: () {
                            showNativeDialog("Flutter调用AlertDialog");
                          },
                          child: Text("简单的按钮"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "按钮",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "哈哈",
                                  style: TextStyle(fontSize: 19),
                                  textAlign: TextAlign.center,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Icon(Icons.access_alarm),
                                flex: 1,
                              ),
                              Expanded(
                                child: FlutterLogo(),
                                flex: 1,
                              ),
                              Expanded(
                                child: Icon(Icons.access_alarm),
                                flex: 1,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Text("体育"),
            ),
            Center(
              child: Text("科技"),
            ),
          ],
        ),
      ),
    );
  }

  void showNativeDialog(String content) async {
    var arguments = Map();
    arguments['content'] = content;
    try {
      String result = await platformChannel.invokeMethod("dialog", arguments);
      print("showDialog" + result);
    } on PlatformException catch (e) {
      print("showDialog" + e.code+ e.message+e.details);
    } on MissingPluginException catch (e) {
      print("showDialog"+e.message);
    }
  }
}

///底部第二个bottom页面
class SecondPageItem extends StatefulWidget {
  @override
  _SecondPageItemState createState() => _SecondPageItemState();
}

class _SecondPageItemState extends State<SecondPageItem> {
  List list;

  void initData() {
    list = new List<String>.generate(300, (index) => "第$index行");
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Container(
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              list.remove(index);
            },
            child: ListTile(
              leading: Icon(Icons.remove),
              title: Text("${list[index]}"),
            ),
          );
//          return ListTile(
//            leading: Icon(Icons.access_time),
//            title: Text("${list[index]}"),
//          );
        },
        separatorBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            constraints: BoxConstraints.tightFor(height: 2),
            color: Colors.red,
          );
        },
      ),
    );
  }
}

///底部第三个bottom页面
class ThirdPageItem extends StatefulWidget {
  @override
  _ThirdPageItemState createState() => _ThirdPageItemState();
}

class _ThirdPageItemState extends State<ThirdPageItem>
    with AutomaticKeepAliveClientMixin {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    //初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        onPageChanged: (index) {
          print("当前为$index页");
        },
        children: <Widget>[
          ListTile(
            title: Text("第一页"),
          ),
          ListTile(
            title: Text("第二页"),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //每行三列
                  childAspectRatio: 1.0 //显示区域宽高相等
                  ),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                //如果显示到最后一个
                if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                }
                return Icon(_icons[index]);
              }),
        ],
      ),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
        ]);
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("布局练习"),
          ),
        ),
        body: Column(
          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Container(
//                decoration: BoxDecoration(color: Colors.yellow),
//                height: 300,
//                child: Container(
//                    width: double.infinity,
//                    child: Padding(
//                      padding: EdgeInsets.only(left: 30),
//                      child: Column(
//                        children: <Widget>[
//                          Expanded(
//                            flex: 1,
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                    child: Text.rich(TextSpan(children: [
//                                  TextSpan(
//                                      text: "Rookie!(线性布局)",
//                                      style: TextStyle(
//                                          fontSize: 30, color: Colors.red)),
//                                ])))
//                              ],
//                            ),
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                    child: Text.rich(TextSpan(children: [
//                                  TextSpan(
//                                      text: "易博安卓之神！",
//                                      style: TextStyle(
//                                          fontSize: 30, color: Colors.red)),
//                                ])))
//                              ],
//                            ),
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: Row(
//                              children: <Widget>[
//                                Text(
//                                  "精通底层原理，框架内核!",
//                                  style: TextStyle(
//                                      fontSize: 30, color: Colors.red),
//                                )
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    )),
//              ),
//            ),
//            Expanded(
//                flex:2,
//                child: Container(
//                  padding: EdgeInsets.all(20.0),
//                  width: double.infinity,
//                  decoration: BoxDecoration(color: Colors.red),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Text("Rookie生平(流式布局)", style: TextStyle(color: Colors.white, fontSize: 30)),
//                      Padding(
//                        padding: EdgeInsets.all(10.0),
//                        child: Wrap(
//                          direction: Axis.horizontal,
//                          spacing: 8.0,
//                          runSpacing: 12.0,
//                          children: <Widget>[
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.black,
//                                child: Text("1"),
//                              ),
//                              label: Text("易博组长"),
//                            ),
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.green,
//                                child: Text("2"),
//                              ),
//                              label: Text("Android之神"),
//                            ),
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.blue,
//                                child: Text("3"),
//                              ),
//                              label: Text("IOS之神"),
//                            ),
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.yellow,
//                                child: Text("4"),
//                              ),
//                              label: Text("Flutter之神"),
//                            ),
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.deepOrange,
//                                child: Text("5"),
//                              ),
//                              label: Text("撸管之神"),
//                            ),
//                            Chip(
//                              avatar: CircleAvatar(
//                                backgroundColor: Colors.red,
//                                child: Text("6"),
//                              ),
//                              label: Text("撩妹之神"),
//                            ),
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
////                )),
//            Expanded(
//              flex: 1,
//              child: Container(
//                width: double.infinity,
//                decoration: BoxDecoration(color: Colors.green),
//                child: Stack(
//                  fit: StackFit.expand,
//                  children: <Widget>[
//                    Positioned(
//                      left: 90.0,
//                      top: 120.0,
//                      child: Image.asset(
//                        "assets/timg.jpeg",
//                        width: 200,
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                    Container(
//                      child: Text("啊啊啊",style: TextStyle(color: Colors.red),),
//                      height: 50,
//                      width: 100,
//                      alignment: Alignment.center,
//                    )
//                  ],
//                ),
//              ),
//            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ));
  }
}

class CounterModel  with ChangeNotifier {
  int _count = 0 ;
  int get value => _count;

  void increment(){
    _count ++ ;
    notifyListeners();
  }

}


