///
/// author: bobo
/// create time: 2019/3/26 10:43 PM
/// email: jqbo84@163.com
///

main() {
  /// ---------------------------------异常的抛出throw--------------------------------
  //抛出Exception对象
//  throw new FormatException('格式异常');

  //抛出Error对象
//  throw new NullThrownError();

  //抛出任意非null对象
//  throw '这是一个异常';

  /// ---------------------------------异常的捕获try catch--------------------------------
  ///
  /// Dart 提供了 Exception 和 Error 类型， 以及一些子类型。还可以定义自己的异常类型。但是，Dart 代码可以抛出任何非 null 对象为异常，不仅仅是实现了 Exception 或者 Error 的对象。
  ///
  try {

    throw new NullThrownError();
//    throw new OutOfMemoryError();
  } on OutOfMemoryError {
    //on 指定异常类型
    print('没有内存了');
//    rethrow; //把捕获的异常给 重新抛出
  } on Error {
    //捕获Error类型
    print('Unknown error catched');
  } on Exception catch (e) {
    //捕获Exception类型
    print('Unknown exception catched');
  } catch (e, s) {
    //catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为StackTrace对象堆栈信息
    print(e);
    print(s);
  }

  /// 所有的 Dart 异常是非检查异常。 方法不一定声明了他们所抛出的异常， 并且你不要求捕获任何异常。
  /// Dart 代码可以抛出任何非 null 对象为异常，不仅仅是实现了 Exception 或者 Error 的对象。

  /// 所有的 Dart 异常是非检查异常。 方法不一定声明了他们所抛出的异常， 并且你不要求捕获任何异常。
  /// Dart 代码可以抛出任何非 null 对象为异常，不仅仅是实现了 Exception 或者 Error 的对象。
  /// 可以使用on 或者 catch 来声明捕获语句，也可以 同时使用。使用 on 来指定异常类型，使用 catch 来 捕获异常对象。
  /// catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息 (一个 StackTrace 对象)。
  /// 可以使用rethrow把捕获的异常重新抛出。
}