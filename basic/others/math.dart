import 'dart:math';

void main() {
  List<int> numbers = [10, 20, 30, 40, 50];

  int maxvalue = max(numbers[0], numbers[1]);
  int minvalue = min(numbers[0], numbers[1]);

  print(' max is $maxvalue, min is $minvalue');

  List<int> randomNumbers = _makeRandomNumbers(10, 8);
  print('random number(0..9) is $randomNumbers');

  Random randomnum = Random();
  print(randomnum.nextInt(20));
}

List<int> _makeRandomNumbers(int max, int counts) {
  Random rand = Random();
  List<int> res = List();
  for (int i = 0; i < counts; i++) {
    res.add(rand.nextInt(max));
  }
  return res;
}
