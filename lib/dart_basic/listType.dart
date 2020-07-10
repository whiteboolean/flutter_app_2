main(){
  ///1.列表
  var  names = ["abc","cdb","bda"] ;

  ///2.集合set (不能重复)
  var movies = {"fdasfdsa","fdasfasd","fdsafdsafsda"};
  //花括号
  //去重
  var list = Set<String>.from(names).toList();
//  list.map((e) => print("e:${e}"));
    for (var value1 in list) {
//      print("value:${value1}");
    }
  ///3.映射map
  var info = {
    "name":"why",
    "age":18,
  };
  info.forEach((key, value) {
//    print("key");
  });


  var test1 = [];
  test1.add("1432");
  test1.add(1);
  test1.add("fdas");
  test1.add(1.00);
  for (var value2 in test1) {
    print(value2);
  }


}