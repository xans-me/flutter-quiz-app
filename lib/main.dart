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
  int _currentQuestionIndex = 0;

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

      // We yse [Builder] here to use a [context] that is a descendent of
      // [Scaffold] or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Flag Image on Center
              Center(
                  child:
                      Image.asset("images/flag.png", width: 250, height: 180)),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Previous Button
                  ElevatedButton(
                      onPressed: () => _prevQuestion(),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),

                  // True Choice Button
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900),
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // False Choice Button
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900),
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // Next Button
                  ElevatedButton(
                      onPressed: () => _nextQuestion(),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey.shade900),
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
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    // go to next question after choice
    _updateQuestion();
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
