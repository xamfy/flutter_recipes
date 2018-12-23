import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 50.0,
      //     child: Row(
      //       children: <Widget>[Text("Hi")],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: LoginForm(),
      // floatingActionButton: Builder(
      //   builder: (BuildContext context) {
      //     return FloatingActionButton(
      //       child: Icon(Icons.add),
      //       backgroundColor: Colors.redAccent,
      //       onPressed: () {
      //         Scaffold.of(context).showSnackBar(SnackBar(
      //           content: Text("Message sent!"),
      //           action: SnackBarAction(label: 'OK', onPressed: () {}),
      //         ));
      //       },
      //     );
      //   },
      // ),
    );
  }
}

class LoginForm extends StatefulWidget {
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 150.0),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
              ),
              RaisedButton(
                elevation: 8.0,
                color: Colors.blueAccent,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Navigator.of(context).pop();
                  print(_usernameController.text);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
