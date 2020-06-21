import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
              height: 100.0,
              width: 100.0,
              //margin: EdgeInsets.all(20.0),
              //margin: EdgeInsets.symmetric(vertical:50.0, horizontal: 20.0),
              //margin: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
              margin: EdgeInsets.only(left:30.0), // outside of widget
              padding: EdgeInsets.all(20.0),      // inside of widget
              color: Colors.white,
              child: Text('Hello')
          ),
        ),
      ),
    );
  }
}

