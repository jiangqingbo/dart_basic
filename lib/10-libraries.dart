///
/// author: bobo
/// create time: 2019/3/27 10:21 AM
/// email: jqbo84@163.com
///

import 'dart:math'; //载入核心库

import 'package:dio/dio.dart'; //载入第三方库
//导入文件
import 'mylib.dart';

import 'mylib1.dart' as lib1; //载入文件
import 'mylib2.dart' as lib2; //如果两个库有冲突的标识符，可以为其中一个或两个库都指定前缀

import 'mylib1.dart' as lib1 show Test; //只载入库的某些部分
//import 'mylib2.dart' as lib2 hide Test; //筛选掉库的某些部分

import 'mylib1.dart' deferred as lazyLib; //延迟载入， 就是想用的时候加载

import 'core/lib.dart';//载入自定义库
//part 分包导入

/// 1.part 可以把一个库分开到多个 Dart 文件中。
/// 2.或者我们想让某一些库共享它们的私有对象的时候，可以需要使用part。
/// 3.import不会完全共享作用域，而part之间是完全共享的。如果说在A库中import了B库，B库import了C库，A库是没有办法直接使用C库的对象的。而B,C若是A的part，那么三者共享所有对象。并且包含所有导入。

/// import 后的必须参数为库 的 URI。（Uniform Resource Identifier统一资源标识符)
/// 对于内置的库，URI 使用特殊的 dart: scheme。
/// 对于其他的库，你可以使用文件系统路径或者 package: scheme。
/// pubspec.yaml声明需要引用的库，使用Packages get进行拉取。
void main() {
  //使用核心库
  print(sqrt(4));

  //调用第三方库
  getHttp();
  //导入文件
  MyLib();

  /// 载入文件
  /// mylib1.dart 和 mylib2.dart 都有一个名字为 MyLib 的类。
  var myLib1 = lib1.MyLib();
  var myLib2 = lib2.MyLib();

  //选择性载入
  var test = lib1.Test();
  var lib = lib2.MyLib();

  //延迟载入
  lazyLoad();

  //载入自定义库
  printMyLib();
  printUtil();
  printTool();
}

//调用第三方库
void getHttp() async {
  try {
    Response response = await Dio().get("https://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

/// 1.延迟载入，使用 await 关键字暂停代码执行一直到库加载完成。
/// 2.可提高程序启动速度
/// 3.用在不常使用的功能
/// 4.用在载入时间过长的包
/// 5.执行 A/B 测试，例如 尝试各种算法的 不同实现。
lazyLoad() async {
  await lazyLib.loadLibrary();
  var t = lazyLib.Test();
  t.test();
}

