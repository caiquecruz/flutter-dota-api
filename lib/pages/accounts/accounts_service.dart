import 'package:flutter_project/pages/accounts/accounts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AccountService {
  static Future<List<Account>> getAccounts(account) async {
    final url = 'https://api.opendota.com/api/search?q=$account';

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    final accounts = list.map<Account>((map) => Account.fromJson(map)).toList();

    return accounts;
  }
}
