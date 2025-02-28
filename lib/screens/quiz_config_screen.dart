import 'package:flutter/material.dart';

class QuizConfigurationScreen extends StatefulWidget {

  const QuizConfigurationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizConfigurationState();
  }
}

class _QuizConfigurationState extends State<QuizConfigurationScreen> {
  Widget activeScreen = const QuizConfigurationScreen();

  void switchScreen() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(),
      ),
    );
  }
}