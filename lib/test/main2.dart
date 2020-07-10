import 'package:flutter/material.dart';

void main() => runApp(new MyApp2());

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

//State生命周期
class _MyApp2State extends State<MyApp2> {
  String data = "你很牛逼";
  bool isShowChild = false;

  _MyApp2State() {
    debugPrint("构造方法");
    //这里使用了FutureEvent队列
    Future.delayed(Duration(seconds: 3)).then((value) {
//      debugPrint("111111111111111111");
      this.data = "你更牛逼！";
      //修改状态updateState 刷新ui，重绘，调用Build方法
      setState(() {
//        debugPrint("2222222222222222222");
      });
    });
  }

  ///当widget第一次插到widget树时会被调用，对于每一个State对象，Flutter frameWork只会调用一次该问题
  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }


  @override
  Widget build(BuildContext context) {
    debugPrint("buildddddddddddddd");
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text(data),
        ),
        body: Center(
//          child: Text(data),
          child: RaisedButton(
            //点击事件
            onPressed: (){
              setState(() {
                data = "fafds" ;
                isShowChild = !isShowChild ;
              });
            },
            child:isShowChild?Child():Text("哈哈哈"),
          ),
        ),
      ),
    );
  }
}


class Child extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
      debugPrint("child child...");
          return Text("lifeCycle");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("child initState") ;
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    debugPrint("child didChangeDependencies") ;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    debugPrint("child deactivate");
  }


  ///进行内存清理
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("child dispose");
  }






}

