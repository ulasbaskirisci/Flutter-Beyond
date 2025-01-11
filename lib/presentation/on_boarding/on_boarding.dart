import 'package:flutter/material.dart';
import 'package:flutterankara_2/main.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  final ValueChanged<ThemeMode> onThemeChanged;

  const OnboardingPage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Hoş Geldiniz",
          body: "Uygulamanın özelliklerini keşfedin.",
          image: Center(
            child: Image.asset("assets/images/onboarding1.png", height: 175.0),
          ),
        ),
        PageViewModel(
          title: "Kolay Kullanım",
          body: "Hızlı ve basit bir deneyim yaşayın.",
          image: Center(
            child: Image.asset("assets/images/onboarding2.png", height: 175.0),
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: 'Flutter Demo Home Page',
            onThemeChanged: onThemeChanged,
          ),
        ));
      },
      showSkipButton: true,
      skip: const Text("Atla"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Tamam", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
