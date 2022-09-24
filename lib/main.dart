import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['What\'s your strenth?', 'What\'s your weakness?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cognuro Flutter/Dart Code Sample'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
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
