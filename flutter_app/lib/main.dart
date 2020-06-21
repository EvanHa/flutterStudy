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
            //verticalDirection: VerticalDirection.down,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, // 중앙 정렬
            //crossAxisAlignment: CrossAxisAlignment.end, // 위젯의 끝 라인을 맞춰서 정렬
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 100.0,
                    color: Colors.white,
                    child: Text('Container 1')
                ),
                SizedBox(
                  height: 20.0,
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
