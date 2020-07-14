void main(){
  ///Dart的面向对象
//  var p = Person();//默认构造函数

var p = Person.withNameHeightAge("ef", 33, 12);

//父类引用指向子类对象
  //object obj = "why";
  //print(obj.subString(1))
//Object ibk = "why";
//print("obj");

  //var 运行时推导
  //明确声明
dynamic obj = "why";
//print(obj.subString(1));

//print(p.toString());


}


class Person{
  String name;
  int age;
  double height;
//  Person(String name,int age){
//    this.name = name;
//    this.age = age;
//  }

//  Person(){}

  //语法糖
  Person(this.name,this.age ,{this.height});
  //Dart中没有方法重载

  Person.withNameHeightAge(this.name,this.height,this.age);

  Person.fromMap(Map<String,dynamic> map); //dynamic -> Any

}