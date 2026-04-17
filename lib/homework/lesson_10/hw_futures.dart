void main() async {
  Future<String> fetchName() async {
    final myDelay = Future<void>.delayed(Duration(seconds: 2));
    await myDelay;
    return 'Roman';
  }

  final name = await fetchName();
  print('Мене звати $name');
  print('________________end_task_1_______________');

  Future<String> fetchAge(int age) async {
    final myDelay = Future<void>.delayed(Duration(milliseconds: 1500));
    await myDelay;
    return age.toString();
  }

  final ageString = await fetchAge(13);
  final ageInt = int.parse(ageString);
  var ageEnding = '';
  final ageNumbers = ageInt.toString().split('').map(int.parse).toList();
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

  print('Мені $ageString $ageEnding');
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
  final paralell = await Future.wait([fetchAge(25), fetchName()]);
  stopwatch.stop();
  print(paralell);
  timer = stopwatch.elapsedMilliseconds;
  print('Час виконання двох методів паралельно: $timer мілісекунд');
  print('________________end_task_4_______________');

  Future<String> delayedCountdown(int seconds) async {
    var sec = seconds;
    while (sec > 0) {
      print('$sec... ');
      final myDelay = Future<void>.delayed(Duration(seconds: 1));
      await myDelay;
      sec = sec - 1;
    }
    return 'Старт!';
  }

  print(await delayedCountdown(5));
}
