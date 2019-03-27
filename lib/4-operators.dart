///
/// author: bobo
/// create time: 2019/3/26 10:25 PM
/// email: jqbo84@163.com
///

main() {
  //Operators 操作符
  /// ---------------------------------后缀操作符 ?.--------------------------------

  /// “?.”，条件成员访问 和 . 类似，但是左边的操作对象不能为 null，例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员。
  /// “~/”，除后取整。
  /// “as”，类型转换。
  /// “is”，如果对象是指定类型返回true。
  /// “is!”，如果对象是指定类型返回false。
  /// “??”，双问号左边为true返回左边结果，否则返回右边结果。
  /// “..”，级联语法。严格来说， 两个点的级联语法不是一个操作符。 只是一个 Dart 特殊语法。
  /// “??:”，如果左边是 null，则右边赋值给左边；如果不是 null，则左边的值保持不变


  //  条件成员访问 和 . 类似，但是左边的操作对象不能为 null，例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员
  String a;
  print(a?.length);

  /// ---------------------------------取商操作符 ~/--------------------------------
  //  被除数 ÷ 除数 = 商 ... 余数，A ~/ B = C，这个C就是商。相当于Java里的 /
  print(2 / 3);
  print(2 ~/ 3);

  /// ---------------------------------类型判定操作符--------------------------------
  //类型判定操作符：as、is、is!在运行时判定对象类型
  //as 类型转换
  num iNum = 1;
  num dNum = 1.0;
  int i = iNum as int;
  double d = dNum as double;
  print([i, d]);

//  String s = iNum as String;

  //is 如果对象是指定的类型返回 True
  print(iNum is int);
  Child child;
  Child child1 = new Child();
  print(child is Parent); //child is Null
  print(child1 is Parent);

  //is! 如果对象是指定的类型返回 False
  print(iNum is! int);

  /// ---------------------------------条件表达式--------------------------------
  // 三目运算符 condition ? expr1 : expr2
  bool isFinish = true;
  String txtVal = isFinish ? 'yes' : 'no';
  // expr1 ?? expr2，如果 expr1 是 non-null，返回其值； 否则执行 expr2 并返回其结果。
  bool isPaused;
  isPaused = isPaused ?? false;
  //或者
  isPaused ??= false;

  /// ---------------------------------级联操作符--------------------------------
  // .. 可以在同一个对象上 连续调用多个函数以及访问成员变量。
  // 严格来说， 两个点的级联语法不是一个操作符。 只是一个 Dart 特殊语法。
  StringBuffer sb = new StringBuffer();
  sb
    ..write('jiangqingbo')
    ..write('flutter')
    ..write('\n')
    ..writeln('bobo');

  //重写操作符

}

class Parent {}

class Child extends Parent {}
