import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HeroeService {
  static Future<List<Heroe>> getGeroes() async {
    final heroesUrl = 'https://api.opendota.com/api/heroes';

    var response = await http.get(heroesUrl);

    // Obter json completo;
    String json = response.body;

    // Usar biblioteca convert do dart para lista de Maps

    //conver.json.decode => JSON string para Lista de Maps
    List list = convert.json.decode(json);

    // Iterar Maps e transformar em lista
    final heroes = list.map<Heroe>((map) => Heroe.fromJson(map)).toList();

    return heroes;
  }
}
