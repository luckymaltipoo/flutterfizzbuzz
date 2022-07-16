class GlobalMethod {
  static Future<List> loadFizzBuzzData(int num) async {
    List results = [];
    int number = num;
    try {
      for (var i = 1; i <= number; i++) {
        bool fizz = i % 3 == 0;
        bool buzz = i % 5 == 0;
        if (fizz && buzz) {
          results.add('FizzBuzz');
        } else if (fizz) {
          results.add('Fizz');
        } else if (buzz) {
          results.add('Buzz');
        } else {
          results.add(i.toString());
        }
      }
      ;
    } catch (err) {
      print(err);
      return [];
    }

    return results;
  }
}
