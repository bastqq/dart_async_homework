void main() async {
  Future<String> fetchName() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Roman';
  }

  String name = await fetchName();
  print('Мене звати $name');
  print('________________end_task_1_______________');

  Future<String> fetchAge(int age) async {
    await Future.delayed(Duration(milliseconds: 1500));
    return age.toString();
  }

  String ageString = await fetchAge(13);
  int ageInt = int.parse(ageString);
  String ageEnding = '';
  List<int> ageNumbers = ageInt.toString().split('').map(int.parse).toList();
  final pokuList = [2, 3, 4];
  final notPokuList = [11, 12, 13, 14];
  if (ageNumbers.last == 1 && ageInt != 11) {
    ageEnding = 'рік';
  } else if (pokuList.contains(ageNumbers.last) &&
      !notPokuList.contains(ageInt)) {
    ageEnding = 'роки';
  } else {
    ageEnding = 'років';
  }

  print("Мені $ageString $ageEnding");
  print('________________end_task_2_______________');
}
