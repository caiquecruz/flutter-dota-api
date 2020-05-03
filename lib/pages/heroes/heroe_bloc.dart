import 'dart:async';
import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:flutter_project/pages/heroes/heroe_service.dart';

class HeroeBloc {
  final _heroeStreamController = StreamController<List<Heroe>>();

  get heroeStream => _heroeStreamController.stream;

  Future getHeroes() async {
    try {
      List<Heroe> heroes = await HeroeService.getGeroes();
      _heroeStreamController.add(heroes);
      print(heroes);
    } catch (err) {
      _heroeStreamController.addError(err);
    }
  }

  dispose() {
    this._heroeStreamController.close();
  }
}
