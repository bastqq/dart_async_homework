void main() async {
  Future<String> fetchName() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Roman';
  }

  String res = await fetchName();
  print('Мене звати $res');
}
