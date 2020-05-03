import 'dart:async';

import 'package:flutter_project/pages/accounts/accounts.dart';
import 'package:flutter_project/pages/accounts/accounts_service.dart';

class AccountBloc {
  final _accountStreamController = StreamController();

  get accountStream => _accountStreamController.stream;

  Future getAccounts(account) async {
    try {
      _accountStreamController.add('loading');
      List<Account> accounts = await AccountService.getAccounts(account);
      _accountStreamController.add(accounts);
    } on TimeoutException {
      _accountStreamController.addError('Timeout');
    } catch (err) {
      _accountStreamController.addError(err);
    }
  }

  disposeAccountList() {
    _accountStreamController.close();
    // _accountNameController.close();
  }
}
