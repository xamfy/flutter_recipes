import 'package:flutter/material.dart';

// libraries 3rd party
import 'package:cached_network_image/cached_network_image.dart';

// pages
// import 'pages/bottom_nav.dart';
// import 'pages/http_example.dart';
// import 'pages/tab_nav.dart';
// import 'pages/stateful_example.dart';
// import 'pages/cloud_firestore.dart';
// import 'pages/card.dart';
// import 'pages/shared_preferences_example.dart';
// import 'pages/reading_writing_files.dart';

// root page
import 'root_page.dart';

// auth
import 'auth.dart';
import 'auth_provider.dart';
import 'google_auth.dart';

void main() => runApp(AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // '/': (context) => Home(),
          // '/': (context) => RootPage(),
          '/': (context) => GoogleAuth(),
          // '/login': (context) => LoginPage(),
          // '/bottom_nav': (context) => BottomNav(),
        },
        debugShowCheckedModeBanner: false,
        // home: Home(),
      ),
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
            // ListTile(
            //   title: Text('Login'),
            //   onTap: () {
            //     // Navigator.of(context).pop();
            //     Navigator.pushNamed(context, '/login');
            //   },
            // ),
            // ListTile(
            //   title: Text('Close'),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            ListTile(
              title: Text('Bottom Nav'),
              onTap: () {
                Navigator.pushNamed(context, '/bottom_nav');
              },
            ),
            // ListTile(
            //   title: Text('Http'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => HttpExample()));
            //   },
            // ),
            // ListTile(
            //   title: Text('TabBar nav'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => TabNavWidget()));
            //   },
            // ),
            // ListTile(
            //   title: Text('Counter'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => Counter()));
            //   },
            // ),
            // ListTile(
            //   title: Text('Cloud firestore'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             CloudFireStoreExample()));
            //   },
            // ),
            // ListTile(
            //   title: Text('Card'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => CardWidget()));
            //   },
            // ),
            // ListTile(
            //   title: Text('Shared prefs'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             SharedPrefExample(title: 'Shared prefs')));
            //   },
            // ),
            // ListTile(
            //   title: Text('Reading writing files'),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => FilesExample()));
            // },
            // ),
          ],
        ),
      ),
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }
}
