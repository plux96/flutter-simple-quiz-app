import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.6,
              child: Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
