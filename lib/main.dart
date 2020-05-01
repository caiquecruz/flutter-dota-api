import 'package:flutter/material.dart';
import 'package:flutter_project/pages/heroes/heroe_model.dart';
import 'package:flutter_project/pages/home/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroeModel>.value(value: HeroeModel()),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(199, 81, 61, 1),
        ),
        home: Home(),
      ),
    );
  }
}
