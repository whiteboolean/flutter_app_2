void main() {
  //赋值运算符
  var name = "why";
  name ??= "lilei";
  // ??= 原来的变量有值，不执行，如果为空，则赋值

  //??:
  var name1 = "why";
  var temp1 = name == null ? "lilei" : name; //三目元算符
  var temp = name ?? "lilei";

  ///三目运算符简化版  如果？？前面有值就使用？？前面的值，否则使用？？后面的值

  /// 级联运算符
  var p = Person("fdas")
    ..name
    ..toString();



  //for循环
  var list = [1,2,3,4,5,5];
  for (var value in list) {
    print(value);
  }

  for(int i =0;i<list.length;i++){
    print(i);
  }


  list.forEach((element) {
    print("element:$element");
  });


  //
}

class Person {
  String name;

  Person(this.name);
}
