import 'package:fizzbuzzapp/screen/input.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzzapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:fizzbuzzapp/consts/theme_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();

  void getAppTheme() async {
    themeProvider.darkTheme = await themeProvider.themePreferences.getTheme();
  }

  @override
  void initState() {
    getAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          })
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Numbers',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: const InputScreen(),
          );
        }));
  }
}
