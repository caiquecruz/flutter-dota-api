import 'package:flutter/material.dart';
import 'package:flutter_project/pages/accounts/accounts_page.dart';
import 'package:flutter_project/pages/heroes/heroes_page.dart';
import 'package:flutter_project/pages/home/home_btn.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      color: Color.fromRGBO(214, 132, 126, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'assets/dota-logo.png',
            ),
          ),
          Column(
            children: <Widget>[
              homeBtn('Heroes', context, Heroes()),
              homeBtn('Accounts', context, Accounts()),
            ],
          )
        ],
      ),
    );
  }
}
