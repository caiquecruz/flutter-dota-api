import 'package:flutter/cupertino.dart';
import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:flutter_project/pages/heroes/heroe_service.dart';

class HeroeModel extends ChangeNotifier {
  List<Heroe> heroes = [];

  void getHeroes() async {
    heroes = await HeroeService.getGeroes();

    notifyListeners();
  }
}
