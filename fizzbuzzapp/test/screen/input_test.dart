import 'package:flutter_test/flutter_test.dart';
import 'package:fizzbuzzapp/screen/input.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzzapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  ThemeProvider themeProvider = ThemeProvider();
  testWidgets('When user input number 3 , 3 listtiles are rendered',
      (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child: const MaterialApp(home: InputScreen()),
    ));
    await tester.enterText(find.byKey(const Key('inputField')), '3');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('listtilekey')), findsNWidgets(3));
  });
}
