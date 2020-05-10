import 'package:flutter/material.dart';
import 'package:flutter_project/pages/match/match.dart';
import 'package:flutter_project/pages/match/match_bloc.dart';

class MatchesPage extends StatefulWidget {
  final int accountId;

  MatchesPage(this.accountId);

  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final _matchBloc = MatchBloc();

  _fetch(int accountId) {
    _matchBloc.getMatches(accountId);
  }

  @override
  Widget build(BuildContext context) {
    _fetch(widget.accountId);
    return Scaffold(
        appBar: AppBar(
          title: Text('Matches'),
        ),
        body: _body());
  }

  _body() {
    return StreamBuilder(
      stream: _matchBloc.matchStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          List<Matches> listMatches = snapshot.data;
          return Container(child: _listView(listMatches));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _matchBloc.dispose();
  }

  _listView(List<Matches> matches) {
    return ListView.separated(
        separatorBuilder: (_, context) => Divider(),
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: matches[index].radiantWin
                    ? Text('WIN',
                        style: TextStyle(color: Colors.green, fontSize: 20))
                    : Text('LOSS',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                title: Row(
                  children: <Widget>[
                    Text('K:' + matches[index].kills.toString()),
                    SizedBox(width: 20),
                    Text('D:' + matches[index].deaths.toString()),
                    SizedBox(width: 20),
                    Text('A:' + matches[index].assists.toString()),
                  ],
                ),
              ));
        });
  }
}
