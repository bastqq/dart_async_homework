import 'dart:async';

void main() async {
  final numbers = [1, 2, 3, 4, 5];

  final myStream = Stream.fromIterable(numbers);

  await for (final data in myStream) {
    print(data);
  }

  final sub = myStream.listen((print) {});
  sub.cancel();

  final streamInt = Stream.periodic(Duration(seconds: 1), (index) {
    return index;
  }).take(10);

  await for (final value in streamInt) {
    print('$value...');
  }

  final controler = StreamController<String>();

  controler.add('Hello');
  controler.add('World');
  controler.add('Dart');
  controler.add('Єгоза');
  controler.add('Крагі');
  controler.add('Тягнути');

  final subControler = controler.stream.listen(
    print,
    onDone: () {
      print('Стрім завершено');
    },
  );

  await controler.close();
  await subControler.cancel();
}
