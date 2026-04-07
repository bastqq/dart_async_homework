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

  final stopwatch = Stopwatch();

  stopwatch.start();
  await fetchName();
  stopwatch.stop();
  var timer = stopwatch.elapsedMilliseconds;
  stopwatch.reset();
  stopwatch.start();
  await fetchAge(36);
  stopwatch.stop();
  timer = timer + stopwatch.elapsedMilliseconds;
  print('Час виконання двох методів: $timer мілісекунд');
  print('________________end_task_3_______________');

  stopwatch.reset();
  stopwatch.start();
  var paralell = await Future.wait([fetchAge(25), fetchName()]);
  stopwatch.stop();
  print(paralell);
  timer = stopwatch.elapsedMilliseconds;
  print('Час виконання двох методів паралельно: $timer мілісекунд');
  print('________________end_task_4_______________');
}
