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
}
