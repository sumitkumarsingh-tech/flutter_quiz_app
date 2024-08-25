import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({required this.options, required this.chooseOptions, super.key});
  final String options;
  final void Function() chooseOptions;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.green.shade900,
          foregroundColor: Colors.white),
      onPressed: () {
        chooseOptions();
      },
      child: Text(
        options,
        style: GoogleFonts.crimsonPro(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
