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
          child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/somi.png'),
                ),
                Text(
                  'Somi',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,

                  )
                ),
                Container(
                    height: 100.0,
                    color: Colors.blue,
                    child: Text('Container 2')
                ),
                Container(
                    height: 100.0,
                    color: Colors.red,
                    child: Text('Container 3')
                )
              ],
          ),
        ),
      ),
    );
  }
}
