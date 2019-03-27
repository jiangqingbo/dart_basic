///
/// author: bobo
/// create time: 2019/3/27 11:21 AM
/// email: jqbo84@163.com
///

import 'dart:async';
import 'dart:isolate';
import 'dart:io';


/// 1.Dart没有共享内存的并发，没有竞争的可能性所以不需要锁，也就不用担心死锁的问题。
/// 2.isolate之间没有共享内存，所以他们之间的通信唯一方式只能是通过Port进行，而且Dart中的消息传递总是异步的。
/// 3.isolate神似Thread，但实际上两者有本质的区别。操作系统内的线程之间是可以有共享内存的而isolate没有，这是最为关键的区别。
main() async {
  var receivePort = new ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);

  //'echo'发送的第一个message，是它的SendPort
  //first 是 echo 线程的消息入口
  var sendPort = await receivePort.first;

  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

/// 新isolate的入口函数
echo(SendPort sendPort) async {
  // 实例化一个ReceivePort 打开接收端口以接收消息
  var port = new ReceivePort();

  // 把它的sendPort发送给宿主isolate，以便宿主可以给它发送消息
  sendPort.send(port.sendPort);

  // 监听循环接收消息
  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}

/// 对某个port发送消息，并接收结果
Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}