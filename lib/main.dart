import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(199, 81, 61, 1),
      ),
      home: Home(),
    );
  }
}
