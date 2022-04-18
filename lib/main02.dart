import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestContainer extends StatelessWidget {
  double i = 0.0;

  TestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.all(10),
      child: const Text('Hello, flutter!',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}

class TestApp extends StatelessWidget {
  double i = 0.0;

  TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text("这是",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Text("一个",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.bold))
            ]));
  }
}
