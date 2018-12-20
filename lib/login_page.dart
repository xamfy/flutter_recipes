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
          title: Text('Login'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(child: Text('Login')),
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Message sent!"),
                  action: SnackBarAction(label: 'OK', onPressed: () {}),
                ));
              },
            );
          },
        ));
  }
}
