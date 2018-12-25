import 'package:flutter/material.dart';
import 'auth_provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignedOut;

  HomePage({this.onSignedOut});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userId = "";

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void userEmail(BuildContext context) async {
    var auth = AuthProvider.of(context).auth;
    String id = await auth.currentUser();
    setState(() {
      userId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    userEmail(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout',
                style: TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome,', style: TextStyle(fontSize: 20.0)),
            Center(child: Text('$userId', style: TextStyle(fontSize: 20.0)))
          ],
        ),
      ),
    );
  }
}
