main() {
  //Future
  //await
  //async

//  var p = Person("why");
//
//  //构造函数的重定向
//
//  const p1 = Person("why");
//  const p2 = Person("why");
//  print(identical(p1, p2));
}

class Person {
  final String name;
  String color;

//  final int age;
//   int age;
  //常量构造函数只能
//  const Person(this.name);

  //工厂构造函数
  static final Map<String, Person> _nameCache = {};
  static final Map<String,Person> _colorCache = {} ;

  factory Person.withName(String name){
    if(_nameCache.containsKey(name)){
      return _nameCache[name] ;
    }else{
      final p = Person(name,"default");
      _nameCache[name] = p;
      return p;
    }
  }

  Person(this.name,this.color) ;

//  Person(String name):this._internal(name,0) ;
//  Person._internal(this.name,this.age);
}
