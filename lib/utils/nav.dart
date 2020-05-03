import 'package:flutter/material.dart';

Future push(context, page) async {
  await Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

pop(context, {info}) {
  Navigator.pop(context, info);
}
