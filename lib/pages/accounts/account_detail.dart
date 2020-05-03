import 'package:flutter/material.dart';
import 'package:flutter_project/pages/accounts/accounts.dart';

class AccountDetail extends StatefulWidget {
  final Account account;

  AccountDetail(this.account);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.account.personaname)),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(widget.account.avatarfull),
            ),
          )
        ],
      ),
    );
  }
}
