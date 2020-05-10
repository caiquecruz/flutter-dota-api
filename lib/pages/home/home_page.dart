import 'package:flutter/material.dart';
import 'package:flutter_project/pages/accounts/accounts_page.dart';
import 'package:flutter_project/pages/heroes/heroes_page.dart';
import 'package:flutter_project/utils/nav.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Stack(
      children: <Widget>[
        _menu(),
        _main(),
      ],
    );
  }

  _main() {
    return AnimatedPositioned(
      duration: duration * 1.5,
      top: isCollapsed ? 0 : 0.2 * screenHeight,
      bottom: isCollapsed ? 0 : 0.3 * screenWidth,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      curve: Curves.elasticOut,
      // right: -0.3 * screenWidth,
      child: Container(
        padding: EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width * 1,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.indigo, Colors.red[200]],
          ),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black, offset: Offset(10, 10), blurRadius: 40)
          // ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "assets/images/dota-logo.png",
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: .70,
                      crossAxisSpacing: 20,
                      children: <Widget>[
                        SelectionCard(
                          title: 'HEROES',
                          img: 'assets/images/bs.png',
                          page: Heroes(),
                        ),
                        SelectionCard(
                          usesSvg: true,
                          title: 'ACCOUNTS',
                          img: 'assets/icons/steam.svg',
                          page: Accounts(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  borderRadius: BorderRadius.circular(29.5),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(29.5),
                    onTap: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _menu() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.indigo, Colors.indigo, Colors.red[200]],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('About', style: TextStyle(fontSize: 20)),
              // trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('About', style: TextStyle(fontSize: 20)),
              // trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('About', style: TextStyle(fontSize: 20)),
              // trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('About', style: TextStyle(fontSize: 20)),
              // trailing: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  final String img;
  final String title;
  final bool usesSvg;
  final dynamic page;
  const SelectionCard({
    Key key,
    this.img,
    this.title,
    this.usesSvg = false,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(29.5),
      child: InkWell(
        splashColor: Colors.black38,
        borderRadius: BorderRadius.circular(29.5),
        onTap: () {
          push(context, page);
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget>[
                this.usesSvg
                    ? SvgPicture.asset(
                        this.img,
                        height: 80,
                      )
                    : Image.asset(
                        this.img,
                        height: 80,
                      ),
                SizedBox(height: 30),
                Text(this.title,
                    style: GoogleFonts.cinzel(
                      fontSize: 20,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
