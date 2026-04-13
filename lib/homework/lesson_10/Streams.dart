void main() async {
  final numbers = [1, 2, 3, 4, 5];

  final myStream = Stream.fromIterable(numbers);

  await for (var data in myStream) {
    print(data);
  }

  var sub = myStream.listen((data) {
    print(data);
  });
}
