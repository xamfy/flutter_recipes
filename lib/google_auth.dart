import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

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
                            builder: (BuildContext context) =>
                                HomePage(userName: user.displayName)));
                  }).catchError((e) => print(e)),
            ),
            // RaisedButton(
            //   child: Text('Log out'),
            //   onPressed: _signOut,
            // ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String userName;
  HomePage({this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome $userName'),
      ),
    );
  }
}
