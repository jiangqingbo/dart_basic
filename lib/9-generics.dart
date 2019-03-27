///
/// author: bobo
/// create time: 2019/3/27 10:13 AM
/// email: jqbo84@163.com
///

main() {
  /// Dart1.21开始可以使用泛型函数。
  /// 泛型函数可以在以下几个地方使用类型参数：
  ///        <1>    函数的返回值类型。
  ///        <2>    参数的类型。
  ///        <3>    局部变量的类型。
  /// 使用泛型，很多的容器对象，在创建对象时都可以定义泛型类型,跟java一样
  var list = List<String>();
  list.add('aaa');
  list.add('bbb');
  list.add('ccc');
  print(list);

  var map = Map<int, String>();
  map[1] = 'aaaa';
  map[2] = 'bbbb';
  map[3] = 'cccc';
  print(map);

  //泛型函数
  K addCache<K, V>(K key, V value) {
    K temp = key;
    print('${key}: ${value}');
    return temp;
  }

  var key = addCache('dongnao', 'damon');
  print(key);

  //构造函数泛型
  var p = Phone<String>('123456');
  print(p.mobileNumber);

  //泛型限制， 通过 extends 关键字限定可泛型使用的类型
  var footMassage = FootMassage();
  var m = Massage<FootMassage>(footMassage);
  m.massage.doMassage();

  //运行时可判断泛型
  var names = List<String>();
  print(names is List<String>);
  print(names.runtimeType);

  /// 在Java中，可以测试对象是否为List，但无法测试它是否是List<String>。

}

/// 构造函数泛型
/// 要在使用构造函数时指定一个或多个类型，可将类型放在类名称后面的尖括号<...>中。
class Phone<T> {
  final T mobileNumber;
  Phone(this.mobileNumber);
}

/// 泛型限制
/// 实现泛型类型时，您可能希望限制其参数的类型，可以在<>里面使用extends。
class Massage<T extends FootMassage > {
  final T massage;
  Massage(this.massage);
}

class FootMassage {
  void doMassage() {
    print('脚底按摩');
  }
}
