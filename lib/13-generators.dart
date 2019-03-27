///
/// author: bobo
/// create time: 2019/3/27 11:29 AM
/// email: jqbo84@163.com
///

import 'dart:async';

main() {
  //同步生成器
  //调用getSyncGenerator立即返回Iterable
  var it = getSyncGenerator(5).iterator;
//  调用moveNext方法时getSyncGenerator才开始执行
  while (it.moveNext()) {
    print(it.current);
  }

  //异步生成器
  //调用getAsyncGenerator立即返回Stream,只有执行了listen，函数才会开始执行
  getAsyncGenerator(5).listen((value) => print(value));
  StreamSubscription subscription = getAsyncGenerator(5).listen(null);
  subscription.onData((value) {
    print(value);
    if (value >= 2) {
      subscription.pause(); //可以使用StreamSubscription对象对数据流进行控制
    }
  });

  //递归生成器
  //同步
  var it1 = getSyncRecursiveGenerator(5).iterator;
  while (it1.moveNext()) {
    print(it1.current);
  }
  //异步
  getAsyncRecursiveGenerator(5).listen((value) => print(value));
  print('over');
}

/// 1.使用sync*，返回的是Iterable对象。
/// 2.yield会返回moveNext为true,并等待 moveNext 指令。
/// 3.调用getSyncGenerator立即返回Iterable对象。
/// 4.调用moveNext方法时getSyncGenerator才开始执行。

//同步生成器： 使用sync*，返回的是Iterable对象
Iterable<int> getSyncGenerator(int n) sync* {
  print('start');
  int k = n;
  while (k > 0) {
    //yield会返回moveNext为true,并等待 moveNext 指令
    yield k--;
  }
  print('end');
}


/// 1.使用async*，返回的是Stream对象。
/// 2.yield不用暂停，数据以流的方式一次性推送,通过StreamSubscription进行控制。
/// 3.调用getAsyncGenerator立即返回Stream,只有执行了listen，函数才会开始执行。
/// 4.listen返回一个StreamSubscription 对象进行流监听控制。
/// 5.可以使用StreamSubscription对象对数据流进行控制。

//异步生成器： 使用async*，返回的是Stream对象
Stream<int> getAsyncGenerator(int n) async* {
  print('start');
  int k = 0;
  while (k < n) {
    //yield不用暂停，数据以流的方式一次性推送,通过StreamSubscription进行控制
    yield k++;
  }
  print('end');
}

/// 递归生成器：使用yield*   以指针的方式传递递归对象，而不是整个同步对象。
Iterable<int> getSyncRecursiveGenerator(int n) sync* {
  if (n > 0) {
    yield n;
    yield* getSyncRecursiveGenerator(n - 1);
  }
}

//异步递归生成器
Stream<int> getAsyncRecursiveGenerator(int n) async* {
  if (n > 0) {
    yield n;
    yield* getAsyncRecursiveGenerator(n - 1);
  }
}