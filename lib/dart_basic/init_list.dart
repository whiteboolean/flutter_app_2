void main() {


}


class Person {
  //被final修饰的，如果开始没有初始化，那么再也不能给final赋值了
  final String name;
  final int age;

  Person(this.name, {int age}) :this.age = age ?? 10 {

  }


}