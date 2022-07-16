import 'package:flutter/material.dart';

import 'package:fizzbuzzapp/utils/global_method.dart';
import 'package:provider/provider.dart';
import 'package:fizzbuzzapp/provider/theme_provider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int keyboard_num = 0;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text('Get FizzBuzz',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            actions: [
              if (themeChange.darkTheme)
                IconButton(
                    onPressed: () {
                      setState(() {
                        themeChange.darkTheme = !themeChange.darkTheme;
                      });
                    },
                    icon: Icon(Icons.light_mode,
                        color: Theme.of(context).primaryColor))
              else
                IconButton(
                  onPressed: () {
                    setState(() {
                      themeChange.darkTheme = !themeChange.darkTheme;
                    });
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).primaryColor,
                  ),
                )
            ]),
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (_) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Check out the FizzBuzz from 1 to your favorite number',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        // ignore_for_file: prefer_const_constructors
                        decoration: InputDecoration(
                            labelText: 'Enter Your Number',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            )),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        onChanged: (text) {
                          if (double.tryParse(text) != null) {
                            setState(() => keyboard_num = int.parse(text));
                          } else {
                            setState(() => keyboard_num = 0);
                          }
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: keyboard_num > 0
                        ? FutureBuilder(
                            future: GlobalMethod.loadFizzBuzzData(keyboard_num),
                            builder: (BuildContext ctx,
                                    AsyncSnapshot<List> snapshot) =>
                                snapshot.hasData
                                    ? ListView.builder(
                                        // render the list
                                        itemCount: snapshot.data!.length,
                                        itemBuilder:
                                            (BuildContext context, index) =>
                                                Card(
                                          margin: const EdgeInsets.all(10),
                                          // render list item
                                          child: ListTile(
                                            key: Key('listtilekey'),
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            title: Text(snapshot.data![index]
                                                .toString()),
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        // render the loading indicator
                                        child: CircularProgressIndicator(),
                                      ))
                        : Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              ':)',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                ],
              )),
            )));
  }
}
