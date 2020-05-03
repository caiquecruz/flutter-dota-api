import 'package:flutter/material.dart';
import 'package:flutter_project/pages/accounts/account_detail.dart';
import 'package:flutter_project/pages/accounts/accounts.dart';
import 'package:flutter_project/pages/accounts/accounts_bloc.dart';
import 'package:flutter_project/utils/nav.dart';
import 'package:google_fonts/google_fonts.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  final _accountBloc = AccountBloc();

  final _accountText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  getAccounts(account) {
    _accountBloc.getAccounts(account);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts')),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder(
        stream: _accountBloc.accountStream,
        builder: (context, snapshot) {
          if (snapshot.data == 'loading') {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data != null) {
            List<Account> accounts = snapshot.data;
            return _list(accounts);
          }

          return Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _accountText,
                    decoration: InputDecoration(
                      hintText: 'e.g Joseph',
                      focusColor: Colors.black,
                      labelText: 'Please enter an account name',
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid account';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        this.getAccounts(_accountText.text);
                      }
                    },
                    child: Text('Go!'),
                  )
                ],
              ),
            ),
          );
        });
  }

  _list(List<Account> accounts) {
    print(accounts);
    return Container(
      padding: EdgeInsets.all(18),
      child: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Account account = accounts[index];
              push(context, AccountDetail(account));
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage(accounts[index].avatarfull),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        accounts[index].personaname,
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                      subtitle: Text(
                          'Account ID:' + accounts[index].accountId.toString()),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
                SizedBox(height: 18)
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._accountBloc.disposeAccountList();
  }
}
