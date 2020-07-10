void main(){

  int age = 18 ;
  int hexAge = 0x12 ;
  print(age);
  print(hexAge);


  //字符串转化为数字
  var one = double.parse("122");
  var two = int.parse("123");
  print("one.Type:${one.runtimeType}");
  print("two.type:${two.runtimeType}");


  //数字转化为字符串
  var i = 1;
  var i1 = i.toString() ;

  var a = 1.326 ;
  var a1 = a.toStringAsExponential(2);
  var a2 = a.toStringAsFixed(2); //四舍五入保留两位小数
  var a3 = a.toStringAsPrecision(2);

  print("a1:$a1 a2:$a2 a3:$a3");


}