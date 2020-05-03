import 'package:flutter_project/pages/match/match.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MatchService {
  static Future getMatches(String accountId) async {
    final url = 'https://api.opendota.com/api/players/$accountId/matches';

    print(url);

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    final matches = list.map<Matches>((map) => Matches.fromJson(map)).toList();

    print(matches);

    return matches;
  }
}
