import 'package:flutter/material.dart';
import 'auth_provider.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: BottomAppBar(
//       //   child: Container(
//       //     height: 50.0,
//       //     child: Row(
//       //       children: <Widget>[Text("Hi")],
//       //     ),
//       //   ),
//       // ),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Login',
//           // style: TextStyle(fontSize: 25.0),
//         ),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: LoginForm(),
//       // floatingActionButton: Builder(
//       //   builder: (BuildContext context) {
//       //     return FloatingActionButton(
//       //       child: Icon(Icons.add),
//       //       backgroundColor: Colors.redAccent,
//       //       onPressed: () {
//       //         Scaffold.of(context).showSnackBar(SnackBar(
//       //           content: Text("Message sent!"),
//       //           action: SnackBarAction(label: 'OK', onPressed: () {}),
//       //         ));
//       //       },
//       //     );
//       //   },
//       // ),
//     );
//   }
// }

enum FormType { login, register }

class LoginForm extends StatefulWidget {
  LoginForm({this.onSignedIn});
  final VoidCallback onSignedIn;

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print('Logged in : $userId');
        } else {
          String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print('Registered user : $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  List<Widget> buildInputs() {
    return [
      // SizedBox(height: 150.0),
      TextFormField(
        validator: (value) => value.isEmpty ? "Email can't be empty" : null,
        // controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          // border: OutlineInputBorder(),
        ),
        onSaved: (v) => _email = v,
      ),
      SizedBox(height: 12.0),
      TextFormField(
        validator: (value) => value.isEmpty ? "Password can't be empty" : null,
        // controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          // border: OutlineInputBorder(),
        ),
        onSaved: (v) => _password = v,
        obscureText: true,
      ),
      SizedBox(height: 30.0),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          // elevation: 8.0,
          color: Colors.blueAccent,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text('Sign up'),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        RaisedButton(
          // elevation: 8.0,
          color: Colors.blueAccent,
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text('Have an account? Log in'),
          onPressed: moveToLogin,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _formType == FormType.login ? 'Login' : 'Sign up',
          // style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }
}
