///
/// author: bobo
/// create time: 2019/3/27 12:36 PM
/// email: jqbo84@163.com
///

import 'todo.dart';

void main() {
  dynamic tv = new Television();
  tv.activate();
  tv.turnOn();
  tv.turnOff();
  tv.doSomething();
}

class Television {
  @deprecated
  void activate() {
    turnOn();
  }

  void turnOn() {
    print('Television turn on!');
  }

  @override
  noSuchMethod(Invocation mirror) {
    print('没有找到方法');
  }

  @Todo(who: 'bobo', what: 'create a new method')
  void doSomething() {
    print('doSomething');
    const todo = Todo(who: 'jiangqingbo', what: 'study dart');
    print('${todo.who} ---- ${todo.what}');
  }
}