import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:thebookstore/commons/colors.dart';
import 'package:thebookstore/login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen(context: context);
  }
  Future<void> moveToNextScreen({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 5 ));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/LogoWot1.png',
          ),
          SizedBox(height: 10),
          AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                'Discover, Exchange, Enjoy - Your Book Adventure Await',
                textStyle: TextStyle(
                  color: yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}