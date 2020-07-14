main() {
  final p = Person();

  //直接访问属性
  p.name = "why";
  print(p.name);
}

class Person {
  String _name;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  /// setter
//  set setName(String name){
//    this.name = name ;
//  }
//
//  String get getName{
//    this.name = name ;
//  }

  ///getter
}

class Animal {
  int age;

  Animal(this.age);
}

class Person1 extends Animal {
  String name;

  Person1(this.name, int age) : super(age);

}
