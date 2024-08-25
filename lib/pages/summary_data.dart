import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: summaryData.map((element) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            element["right-answer"] == element["chosen-answer"]
                                ? Colors.blue.shade900
                                : Colors.red.shade900),
                    child: Center(
                      child: Text(
                        ((element["question-index"] as int) + 1).toString(),
                        style: GoogleFonts.crimsonPro(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(element["question"].toString(),
                          style: GoogleFonts.crimsonPro(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text(
                          "Correct Answer. ${element["right-answer"].toString()}",
                          style: GoogleFonts.crimsonPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                      Text(
                          "Your Answer. ${element["chosen-answer"].toString()}",
                          style: GoogleFonts.crimsonPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
