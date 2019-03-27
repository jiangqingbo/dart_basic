///
/// author: bobo
/// create time: 2019/3/26 10:30 PM
/// email: jqbo84@163.com
///

main() {
  /// Dart中控制流程语句和Java类似。
  /// List和Set等实现了Iterable接口的类支持for-in遍历元素。

  var collection = [0, 1, 2];
  //forEach
  collection.forEach((item) => print('forEach: $item'));
  //for-in遍历元素
  for (var item in collection) {
    print('for-in: $item');
  }
}


