import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/model/question.dart';

void main() {
  runApp(new MaterialApp(
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name("Dinar adalah salah satu mata uang Indonesia.", false),
    Question.name("Tanggal 1 Juni adalah Hari Kebangkitan Pancasila", false),
    Question.name("BJ. Habibie adalah Bapak Dirgantara Indonesia", true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Flag Image on Center
            Center(
                child: Image.asset("images/flag.png", width: 250, height: 180)),

            Container(
              height: 120.0,
              child: Text(questionBank[2].questionText),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
