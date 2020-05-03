import 'package:flutter/material.dart';
import 'package:flutter_project/pages/accounts/accounts.dart';
import 'package:flutter_project/pages/match/match_page.dart';
import 'package:flutter_project/utils/nav.dart';

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(widget.account.avatarfull),
            ),
            Text(
              'Account ID:' + widget.account.accountId.toString(),
              style: TextStyle(fontSize: 20),
            ),
            ButtonTheme(
              height: 70,
              minWidth: 70,
              buttonColor: Colors.blueGrey,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  push(context, MatchesPage(widget.account.accountId));
                },
                child: Container(
                  width: 105,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Matches',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
