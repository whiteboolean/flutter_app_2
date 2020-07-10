main() {
  //1.明确的声明
  String name = "why";

  //2.类型推导(var/final/const)
  //类型推导的方式虽然没有明确的指定变量的类型，但是变量是有自己明确的类型
  //2.1var声明变量
  var age = 20;
  age = 39;

  //2.2final声明变量
  final height = 1.99;
  // height = 2;

  //2.3const声明常量
  const address = "广州市";
  //address = "北京市";

  //2.4final和const的区别
  //const必须赋值 常量值(编译期间需要有一个确定的值)
  //final 可以通过计算/函数获取一个值(运行期间来确定来确定一个值)
//  const date = DateTime.now();//错误的
  final date = DateTime.now();

  //final用的更多一些
  const p1 = Person("whu"); //Dart2.x开始new可以省略
  const p2 = Person("whu");
  print(identical(p1, p2));

  //dynamic/Object  [Any]

}


class Person {
  final String name ;

  const Person(this.name);

//  const Person(String name) {
//    this.name = name;
//  }
}
