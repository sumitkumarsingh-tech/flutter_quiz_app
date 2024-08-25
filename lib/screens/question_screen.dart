import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/pages/questions_page.dart';
import '../custom_widget/custom_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.optionSelected});
  final void Function(String answer) optionSelected;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void changeIndex(String answer) {
    setState(() {
      widget.optionSelected(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionSet[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questions,
              style: GoogleFonts.crimsonPro(
                  fontSize: 24, fontWeight: FontWeight.w500, height: 1.1),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledOptions().map((element) {
              return Button(
                options: element,
                chooseOptions: () {
                  changeIndex(element);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
