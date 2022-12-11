import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<Screen2> createState() => Screen2State();
}

class Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.changeTheme(Theme.of(context).brightness == Brightness.light
              ? ThemeMode.dark
              : ThemeMode.light);
        },
        label: const Text('ChangeTheme'),
        icon: const Icon(Icons.thermostat),
        backgroundColor: Colors.pink,
      ),
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Практическая работа №5'),
        ),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text(
                  (ModalRoute.of(context)?.settings.arguments as String?) ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
