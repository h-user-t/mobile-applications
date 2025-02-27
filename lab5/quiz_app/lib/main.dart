import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //class variables

  int groupValue = 2;
  int score = 0;
  //currentQuestion is used to iterate the array/list
  int currentQuestion = 0;

  var questions = ["Question 1", "Question 2", "Question 3"];
  var answers = [0, 0, 1];
  var bgColor = Colors.white;
  String result = "";
  //class methods
  checkAnswer(int answer){

    print("User answered $answer");
    
    if (answers[currentQuestion] == answer) {
      result = "Correct";
      score++;
      bgColor = Colors.green;
    } else {
      result = "Incorrect";
      bgColor = Colors.red;
    }
    //if answer is true, set the score and show the result
    //set the groupValue to what they answer
    setState(() {
      groupValue = answer;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Quiz App"),),
        body: Container(
          color: bgColor,
          padding: EdgeInsets.all(36.6),
          child: Column(children: <Widget>[
            Text(questions[currentQuestion]),
            Row(children: <Widget>[
              Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{ checkAnswer(e!) }),
              Text("True"),
              Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{ checkAnswer(e!) }),
              Text("False"),
            ],),
            TextButton(onPressed: ()=>{ setState(() {
              if (currentQuestion < questions.length - 1){
                currentQuestion++;
              }
              else {
                currentQuestion = 0;
                score = 0;
              }
              groupValue = 2;
              result = "";
              bgColor = Colors.white;
            })}, child: Text("Next")),
            Text(result),
            Text("SCORE: $score"),
            ]
          ),
          ),
    );
  }
}
