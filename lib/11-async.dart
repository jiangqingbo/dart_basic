///
/// author: bobo
/// create time: 2019/3/27 11:13 AM
/// email: jqbo84@163.com
///

import 'dart:async';

main() async {
  // async wait
  /// await关键字必须在async函数内部使用
  /// await表达式可以使用多次
//  getName1();
//  getName2();
//  getName3();

  /// 如果需要监听“完毕”这个状态，那么用whenComplete,需要监听“成功”这个状态，用then，需要监听“失败”这个状态，用catchError。
  /// 如果重写了test方法，test返回true就可以在catchError的onError方法里捕获到异常，如果test返回false，就把该异常继续抛出而不会在catchError方法里被捕获，如果不写test默认实现一个返回true的test方法

  /// 1.一个消息循环的职责就是不断从消息队列中取出消息并处理他们直到消息队列为空。
  /// 2.消息队列中的消息可能来自用户输入，文件I/O消息，定时器等。例如上图的消息队列就包含了定时器消息和用户输入消息。
  /// 3.Dart中的Main Isolate只有一个Event Looper，但是存在两个Event Queue: Event Queue以及Microtask Queue。
  ///
  /// 1.优先全部执行完Microtask Queue中的Event。
  /// 2.直到Microtask Queue为空时，才会执行Event Queue中的Event。
  /// 3.当Event Looper正在处理Microtask Queue中的Event时候，Event Queue中的Event就停止了处理了，此时App不能绘制任何图形，不能处理任何鼠标点击，不能处理文件IO等等。
  /// 4.绘制图形，处理鼠标点击，处理文件IO等都是在Event Queue里完成的。

  //then catchError whenComplete
  new Future(() => futureTask()) //  异步任务的函数
          .then((m) => "a:$m") //   任务执行完后的子任务
          .then((m) => print('a$m')) //  其中m为上个任务执行完后的返回的结果
          .then((_) => new Future.error('error'))
          .then((m) => print('damon'))
          .whenComplete(
              () => print('whenComplete1')) //不是最后执行whenComplete，通常放到最后回调

//      .catchError((e) => print(e))//如果不写test默认实现一个返回true的test方法
          .catchError((e) => print('catchError:' + e), test: (Object o) {
    print('test:' + o);
    return true; //返回true，会被catchError捕获
//        return false; //返回false，继续抛出错误，会被下一个catchError捕获
  }).catchError((e) => print('catchError2:' + e))
      .then((m) => print('dongnao'))
      .whenComplete(() => print('finish'))
      ;

  // Future
//  testFuture();

  //scheduleMicrotask
//  testScheduleMicrotask();
}

//then catchError whenComplete
int futureTask() {
//  throw 'error';
  return 0;
}

void printLength(int length) {
  print("Text Length:$length");
}

// async wait
Future<void> getName1() async {
//  getStr1();//可以不用await打断点看下await后的区别
  await getStr1(); //遇到第一个await表达式执行暂停，返回future对象，await表达式执行完成后继续执行
  await getStr2(); //await表达式可以使用多次
  print('getName1');
}

getStr1() {
  print('getStr1');
}

getStr2() {
  print('getStr2');
}

getName2() {
  print('getName2');
}

getName3() {
  print('getName3');
}

//Future
/// 1.使用new Future将任务加入event队列。
/// 2.Future中的then并没有创建新的Event丢到Event Queue中，而只是一个普通的Function Call，在FutureTask执行完后，立即开始执行。
/// 3.如果在then()调用之前Future就已经执行完毕了，那么任务会被加入到microtask队列中，并且该任务会执行then()中注册的回调函数。
/// 4.使用Future.value构造函数的时候，就会上一条一样，创建Task丢到microtask Queue中执行then传入的函数。
/// 5.Future.sync构造函数执行了它传入的函数之后，也会立即创建Task丢到microtask Queue中执行。
/// 6.当任务需要延迟执行时，可以使用new Future.delay()来将任务延迟执行。
void testFuture() {
  Future f = new Future(() => print("f1"));
  Future f1 = new Future(() => null); //7163524
//  Future f1 = new Future.delayed(Duration(seconds: 1) ,() => null);//7132465
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f3.then((_) => print("f2"));
  f2.then((_) {
    print("f3");
    new Future(() => print("f4"));
    f1.then((_) {
      print("f5");
    });
  });

  f1.then((m) {
    print("f6");
  });
  print("f7");
}

//scheduleMicrotask
/// 1.如果可以，尽量将任务放入event队列中。
/// 2.使用Future的then方法或whenComplete方法来指定任务顺序。
/// 3.为了保持你app的可响应性，尽量不要将大计算量的任务放入这两个队列。
/// 4.大计算量的任务放入额外的isolate中。
void testScheduleMicrotask() {
  //918346572
  scheduleMicrotask(() => print('s1'));

  new Future.delayed(new Duration(seconds: 1), () => print('s2'));

  new Future(() => print('s3')).then((_) {
    print('s4');
    scheduleMicrotask(() => print('s5'));
  }).then((_) => print('s6'));

  new Future(() => print('s10'))
      .then((_) => new Future(() => print('s11')))
      .then((_) => print('s12'));

  new Future(() => print('s7'));

  scheduleMicrotask(() => print('s8'));

  print('s9');
}
