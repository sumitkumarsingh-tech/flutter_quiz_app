import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class StartScreen extends StatelessWidget {

   const StartScreen(this.startQuiz,{super.key});
   final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
              child: Image.asset("assets/images/quiz_mind_pic.png",width: 300,)),
          const SizedBox(height: 30,),
          Text("Let's play a quiz game!",style: GoogleFonts.crimsonPro(
              fontSize: 25,fontWeight: FontWeight.w500,
              color: const Color.fromARGB(150, 255, 255, 255),),
          ),
          const SizedBox(height: 30,),
          OutlinedButton.icon(
             onPressed: (){
               startQuiz();
             },
              style: OutlinedButton.styleFrom(
                shape:  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.green.shade600),
              ),
             icon: const Icon(Icons.arrow_right_alt,color: Colors.white,),
             label: Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child: Text("Start Quiz",style: GoogleFonts.crimsonPro(
                 fontSize: 16,fontWeight: FontWeight.w500,
                ),
                           ),
             ),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
