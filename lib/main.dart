import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen1.dart';
import 'Screen2.dart';

void main() {
  runApp(Applicat());
}

class Applicat extends StatefulWidget {
  @override
  State<Applicat> createState() => ApplicationState();
}

class ApplicationState extends State<Applicat> {
  late ThemeMode theme_mode;
  @override
  void initState() {
    theme_mode = ThemeMode.system;
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("theme_mode")) {
        setState(() {
          theme_mode =
              value.getBool("theme_mode")! ? ThemeMode.light : ThemeMode.dark;
        });
      } else {
        value.setBool(
            "theme_mode", Theme.of(context).brightness == Brightness.light);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практическая работа №5',
      themeMode: theme_mode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Практическая работа №5'),
        ),
        body: Center(
          child: Screen1(
            changeTheme: (themeMode) => setState(() {
              theme_mode = themeMode;
              SharedPreferences.getInstance().then((value) {
                value.setBool("theme_mode", theme_mode == ThemeMode.light);
              });
            }),
          ),
        ),
      ),
    );
  }
}
