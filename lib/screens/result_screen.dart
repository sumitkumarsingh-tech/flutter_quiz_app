import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/pages/summary_data.dart';

import '../pages/questions_page.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.restartQuiz});
  final void Function() restartQuiz;
  final List<String> chosenAnswer;
  List<Map<String, Object>> getResultSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question-index": i,
        "question": questionSet[i].questions,
        "right-answer": questionSet[i].options[0],
        "chosen-answer": chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final noOfQuestions = questionSet.length;
    var calculateCorrectAnswer = getResultSummary().where(
        (element) => element["right-answer"] == element["chosen-answer"]);
    final noOfCorrectAnswer = calculateCorrectAnswer.length;
    return Container(
      margin: const EdgeInsets.only(top: 75, left: 20, right: 20),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                style: GoogleFonts.crimsonPro(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                children: [
                  const TextSpan(text: "You have corrected "),
                  TextSpan(
                      text: "$noOfCorrectAnswer",
                      style: TextStyle(
                          color: Colors.amber.shade900, fontSize: 25)),
                  const TextSpan(text: " out of "),
                  TextSpan(
                      text: "$noOfQuestions",
                      style: TextStyle(
                          color: Colors.amber.shade900, fontSize: 25)),
                  const TextSpan(text: " questions"),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          SummaryData(getResultSummary()),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: () {
              restartQuiz();
            },
            icon: const Icon(
              Icons.replay,
              color: Colors.white,
            ),
            label: Text("Restart quiz",
                style: GoogleFonts.crimsonPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
