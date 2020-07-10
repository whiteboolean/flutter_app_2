main() {
  //函数的基本定义

//  print(sum(1, 2));
  print(sum1(1, 23));
  print(sum1(1, 1));
  print(sum3(3, 3));

  //函数的参数问题
  print(sum4(1, 3));

  sum5(1, num2: 3, num3: 5);

  var fo = foo;

// test(bar);

  //匿名函数 (参数列表){函数体} 固定的格式
  test(() {
    print("匿名函数被打印");
  });

  //箭头函数
  //条件：函数体只能有一行代码

  //函数是一等公民
  var demo1 = demo();
  print(demo1(20,30));
}

///--------------------------------------------------------------------------------------------------------------------------
//函数是一等公民
///对函数的参数和返回值没有限制，一般不用
void tes(Function a) {}

//改进版
void tesUp(int foo(int num, int num2)) {
  foo(30, 20);
}

//继续改进版
typedef Calculate = int Function(int num1, int num2);

void typeUp(Calculate calculate) {
  calculate(10, 29);
}

///--------------------------------------------------------------------------------------------------------------------------

Calculate demo() {
  return (num1, num2) {
    return num1 * num2;
  };
}

///--------------------------------------------------------------------------------------------------------------------------

void test1(void test1(var a, var bo)) {}

/*
*
* 返回值 函数名称(参数列表){
*   函数体
*   return 返回值 ；
* }
*
* */

int sum(int num1, int num2) {
  return num1 + num2;
}

sum1(num1, num2) {
  return num1 + num2;
}

int sum3(var num1, var num2) => num1 + num2;

//位置可选参数
int sum4(var num1, [var num2, var num3]) {
  return num1 + num2;
}

//命名可选参数
int sum5(var num1, {var num2, var num3 = 39}) {
  return num1 + num2 ?? 4;
}

void foo() {
  print("foo");
}

//函数作为参数
void test(Function foo) {
  foo();
}

void bar() {
  print("bar函数被调用");
}

///------------------------------------------------------------------------------
void testDef (TestDe testDe){
  testDe(1,2);
}

typedef TestDe = int Function(int a,int b );
