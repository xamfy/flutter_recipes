import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

// firebase_auth

class GoogleAuth extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print('${user.displayName}');
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print('signed out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Log in with Google'),
              onPressed: () => _signIn().then((FirebaseUser user) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(
                                  user: user,
                                  onSignedOut: _signOut,
                                )));
                  }).catchError((e) => print(e)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  final VoidCallback onSignedOut;

  HomePage({this.user, this.onSignedOut});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut(BuildContext context) async {
    try {
      widget.onSignedOut();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => GoogleAuth()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.user.photoUrl),
          ),
          SizedBox(height: 10.0),
          Text('Welcome ${widget.user.displayName}'),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueAccent,
            onPressed: () => _signOut(context),
          )
        ],
      )),
    );
  }
}
