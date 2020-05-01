import 'package:flutter/material.dart';
import 'package:flutter_project/pages/heroes/heroes_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Heroes()));
            },
            child: Text(
              'Heroes',
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
