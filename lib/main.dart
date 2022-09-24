import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var questions = ['What\'s your strenth?', 'What\'s your weakness?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cognuro'),
        ),
        body: Column(
          children: [
            Text('The Question!'),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
