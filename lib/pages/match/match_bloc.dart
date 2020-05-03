import 'dart:async';

import 'package:flutter_project/pages/match/match.dart';
import 'package:flutter_project/pages/match/match_service.dart';

class MatchBloc {
  final _matchStreamController = StreamController();

  get matchStream => _matchStreamController.stream;

  Future getMatches(int accountId) async {
    try {
      List<Matches> matches = await MatchService.getMatches(
        accountId.toString(),
      );
      _matchStreamController.add(matches);
    } on TimeoutException {
      _matchStreamController.add('timeout');
    } catch (err) {
      _matchStreamController.addError(err);
    }
  }

  dispose() {
    _matchStreamController.close();
  }
}
