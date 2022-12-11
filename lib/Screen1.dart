import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<Screen1> createState() => Screen1State();
}

class Screen1State extends State<Screen1> {
  late TextEditingController textEditor;

  @override
  void initState() {
    textEditor = TextEditingController();
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("str")) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Screen2(
                    changeTheme: widget.changeTheme,
                  ),
              settings: RouteSettings(arguments: value.getString("str"))),
        );
      }
    });
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: TextField(
                controller: textEditor,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (textEditor.text.trim() != "") {
                    SharedPreferences.getInstance().then((value) {
                      value.setString("str", textEditor.text);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Screen2(
                                changeTheme: widget.changeTheme,
                              ),
                          settings: RouteSettings(arguments: textEditor.text)),
                    );
                  }
                },
                child: Text("Перейти на вторую страницу"))
          ],
        ),
      ),
    );
  }
}
