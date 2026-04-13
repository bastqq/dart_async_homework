import 'dart:async';

void main() async {
  final numbers = [1, 2, 3, 4, 5];

  final myStream = Stream.fromIterable(numbers);

  await for (var data in myStream) {
    print(data);
  }

  var sub = myStream.listen((data) {
    print(data);
  });
  sub.cancel();

  Stream<int> streamInt = Stream.periodic(Duration(seconds: 1), (index) {
    return index;
  }).take(10);

  await for (var value in streamInt) {
    print('$value...');
  }

  final controler = StreamController<String>();

  controler.add('Hello');
  controler.add('World');
  controler.add('Dart');
  controler.add('Єгоза');
  controler.add('Крагі');
  controler.add('Тягнути');

  var subControler = controler.stream.listen(
    (onData) {
      print(onData);
    },
    onDone: () {
      print('Стрім завершено');
    },
  );

  await controler.close();
}
