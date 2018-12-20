import 'package:flutter/material.dart';

// pages
import 'package:flutter_chat/login_page.dart';

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
                image: NetworkImage('https://bit.ly/2ByDaIq'),
              )),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://bit.ly/2kdejjC'),
              ),
              accountEmail: Text('trump@covfefe.com'),
              accountName: Text("Covfefe"), // lol :p
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage()));
              },
            ),
            ListTile(
              title: Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
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
