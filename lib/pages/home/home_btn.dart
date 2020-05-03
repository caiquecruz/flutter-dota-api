import 'package:flutter/material.dart';
import 'package:flutter_project/pages/heroes/heroes_page.dart';
import 'package:flutter_project/utils/nav.dart';
import 'package:google_fonts/google_fonts.dart';

homeBtn(title, context, page) {
  return InkWell(
    splashColor: Colors.red,
    child: ButtonTheme(
      minWidth: 150,
      buttonColor: Colors.white,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          push(context, page);
        },
        child: Text(
          title,
          style: GoogleFonts.roboto(fontSize: 20),
        ),
      ),
    ),
  );
}
