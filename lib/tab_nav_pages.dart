import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Icon(Icons.message, size: 150.0)));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Icon(Icons.dehaze, size: 150.0)));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Icon(Icons.face, size: 150.0)));
  }
}
