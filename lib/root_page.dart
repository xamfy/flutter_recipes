import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'auth_provider.dart';

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class RootPage extends StatefulWidget {
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var auth = AuthProvider.of(context).auth;
    auth.currentUser().then((userId) {
      setState(() {
        _authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginForm(
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return HomePage(
          onSignedOut: _signedOut,
        );
    }
  }
}
