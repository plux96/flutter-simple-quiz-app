import "package:adv_basics/data/questions.dart";
import "package:adv_basics/questions_screen.dart";
import "package:adv_basics/results_screen.dart";
import "package:adv_basics/start_screen.dart";
import "package:flutter/material.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
