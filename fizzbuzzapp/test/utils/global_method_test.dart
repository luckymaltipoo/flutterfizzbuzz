import 'package:flutter_test/flutter_test.dart';
import 'package:fizzbuzzapp/utils/global_method.dart';

void main() {
  test(
      'Return list [1,2,fizz,4,buzz,fizz,7,8,fizz,buzz] when loadFizzBuzzData is invoked with number 10',
      () async {
    int userInputNumber = 10;
    List resultList = await GlobalMethod.loadFizzBuzzData(userInputNumber);
    expect(resultList,
        ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz']);
  });
}
