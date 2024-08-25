import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_Screen.dart';

import '../pages/questions_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start screen";
  List<String> selectedOptionsList = [];

  void changeScreen() {
    setState(() {
      activeScreen = "question screen";
    });
  }

  void getChoseAnswer(String answer) {
    selectedOptionsList.add(answer);
    if (selectedOptionsList.length == questionSet.length) {
      setState(() {
        activeScreen = "result screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedOptionsList = [];
      activeScreen = "start screen";
    });
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(changeScreen);
    if (activeScreen == "question screen") {
      screen = QuestionScreen(optionSelected: getChoseAnswer);
    } else if (activeScreen == "result screen") {
      screen = ResultScreen(
        chosenAnswer: selectedOptionsList,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade800, Colors.green.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: screen,
          ),
        ));
  }
}
