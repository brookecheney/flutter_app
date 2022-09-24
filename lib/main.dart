import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['What\'s your strenth?', 'What\'s your weakness?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cognuro Code Sample'),
        ),
        body: Column(
          children: [
            Text('The Question!'),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: () => print('Answer 2 chosen!'),
            ),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: () {
                //...
                print('Answer 3 chosen!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
