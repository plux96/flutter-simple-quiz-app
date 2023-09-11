import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectAns = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You answered $numTotalCorrectAns out of $numTotalQuestions questions correctly",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData: summaryData),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Restart quiz!",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
