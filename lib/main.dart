import 'package:flutter/material.dart';

// libraries 3rd party
import 'package:cached_network_image/cached_network_image.dart';

// pages
import 'package:flutter_chat/login_page.dart';
import 'bottom_nav.dart';
import 'http_example.dart';
import 'tab_nav.dart';
import 'stateful_example.dart';
import 'cloud_firestore.dart';
import 'card.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider('https://bit.ly/2ByDaIq'),
              )),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider('https://bit.ly/2kdejjC'),
              ),
              accountEmail: Text('trump@covfefe.com'),
              accountName: Text("Covfefe"), // lol :p
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              },
            ),
            ListTile(
              title: Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Bottom Nav'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => BottomNav()));
              },
            ),
            ListTile(
              title: Text('Http'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HttpExample()));
              },
            ),
            ListTile(
              title: Text('TabBar nav'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TabNavWidget()));
              },
            ),
            ListTile(
              title: Text('Counter'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Counter()));
              },
            ),
            ListTile(
              title: Text('Cloud firestore'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CloudFireStoreExample()));
              },
            ),
            ListTile(
              title: Text('Card'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CardWidget()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }
}
