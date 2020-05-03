import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HeroeService {
  static Future<List<Heroe>> getGeroes() async {
    final heroesUrl = 'https://api.opendota.com/api/heroes';

    var response = await http.get(heroesUrl);

    String json = response.body;

    List list = convert.json.decode(json);

    final heroes = list.map<Heroe>((map) => Heroe.fromJson(map)).toList();

    return heroes;
  }
}
