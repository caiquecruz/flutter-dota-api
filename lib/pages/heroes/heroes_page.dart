import 'package:flutter/material.dart';
import 'package:flutter_project/pages/heroes/heroe.dart';
import 'package:flutter_project/pages/heroes/heroe_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Heroes extends StatefulWidget {
  @override
  _HeroesState createState() => _HeroesState();
}

class _HeroesState extends State<Heroes> {
  // @override
  // bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HeroeModel model = Provider.of<HeroeModel>(context, listen: false);
    model.getHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
        actions: [
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
      child: Center(
        child: _list(),
      ),
    );
  }

  _list() {
    HeroeModel model = Provider.of<HeroeModel>(context);

    List<Heroe> heroes = model.heroes;

    if (heroes.isEmpty) {
      _refresh();
    }

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

  _refresh() {
    HeroeModel model = Provider.of<HeroeModel>(context);
    model.getHeroes();
  }
}
