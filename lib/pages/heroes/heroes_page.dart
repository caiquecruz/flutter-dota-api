import 'package:flutter/material.dart';
import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:flutter_project/pages/heroes/heroe_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Heroes extends StatefulWidget {
  @override
  _HeroesState createState() => _HeroesState();
}

class _HeroesState extends State<Heroes> {
  final _heroeBloc = HeroeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetch();
  }

  _fetch() {
    print('tapped');
    this._heroeBloc.getHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
        actions: [
          GestureDetector(
            onTap: () {
              _fetch();
            },
            child: Icon(
              Icons.refresh,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.help),
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuItem>[
              PopupMenuItem(child: Text('Carry')),
              PopupMenuItem(child: Text('Support')),
              PopupMenuItem(child: Text('Nuker')),
              PopupMenuItem(child: Text('Initiator')),
              PopupMenuItem(child: Text('Disabler')),
            ],
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: StreamBuilder(
          stream: _heroeBloc.heroeStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data'),
              );
            }

            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Heroe> heroes = snapshot.data;
            return RefreshIndicator(
                child: _list(heroes),
                onRefresh: () async {
                  return _fetch();
                });
          }),
    );
  }

  _list(List<Heroe> heroes) {
    return ListView.builder(
      itemCount: heroes != null ? heroes.length : 0,
      itemBuilder: (context, index) {
        return ListTile(
          subtitle: Text(heroes[index].roles.first),
          contentPadding: EdgeInsets.all(30),
          title: Text(
            heroes[index].localizedName,
            style: GoogleFonts.roboto(fontSize: 20),
          ),
          trailing: Icon(Icons.info),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _heroeBloc.dispose();
  }
}
