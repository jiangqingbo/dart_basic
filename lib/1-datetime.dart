///
/// author: bobo
/// create time: 2019/3/27 3:33 PM
/// email: jqbo84@163.com
///

main(){
  /// 获取当前时间   2019-03-04 14:48:28.948690
  var currentDateTime =DateTime.now();
  print('current datetime $currentDateTime');

  /// 创建一个指定年月日的DateTime对象, 后面可以继续添加时分秒毫秒等
  var dt1 =DateTime(2019,3,3);
  print(dt1);

  var dt2 = DateTime.parse('2019-03-03 20:30:00');
  print(dt2.millisecondsSinceEpoch);

  var dt3 = DateTime.fromMillisecondsSinceEpoch(1551616200000);
  print(dt3);

  var dt4 = DateTime.parse('2019-04-02T12:12:00');
  print(dt4.isBefore(dt2));
}