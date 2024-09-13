import 'dart:async';
import 'dart:isolate';

void calculatePartialSum(SendPort sendPort) async {
  final port = ReceivePort();
  sendPort.send(port.sendPort);
  await for (final message in port) {
    List<int> numbers = message[0];
    SendPort replyTo = message[1];
    int partialSum = numbers.reduce((a, b) => a + b);
    replyTo.send(partialSum);
  }
}

Future<int> runIsolate(List<int> values) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(calculatePartialSum, receivePort.sendPort);
  final sendPort = await receivePort.first as SendPort;
  final answerPort = ReceivePort();
  sendPort.send([values, answerPort.sendPort]);
  return await answerPort.first as int;
}

void main() async {
  List<int> values = List.generate(10000, (index) => index + 1);
  int chunkSize = values.length ~/ 5;
  List<List<int>> chunks = [
    values.sublist(0, chunkSize),
    values.sublist(chunkSize, 2 * chunkSize),
    values.sublist(2 * chunkSize, 3 * chunkSize),
    values.sublist(3 * chunkSize, 4 * chunkSize),
    values.sublist(4 * chunkSize, values.length),
  ];
  List<Future<int>> futures = chunks.map(runIsolate).toList();
  List<int> partialSums = await Future.wait(futures);
  int totalSum = partialSums.reduce((a, b) => a + b);
  double average = totalSum / values.length;
  print('El promedio de los 10,000 valores es: $average');
}