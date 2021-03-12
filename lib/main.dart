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
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Flag Image on Center
            Center(
                child: Image.asset("images/flag.png", width: 250, height: 180)),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    )),
                height: 120.0,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questionBank[2].questionText,
                    style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () => _checkAnswer(),
                  color: Colors.blueGrey.shade900,
                  child: Text(
                    "TRUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _checkAnswer(),
                  color: Colors.blueGrey.shade900,
                  child: Text(
                    "FALSE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ))
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer() {}

  _nextQuestion() {}
}
