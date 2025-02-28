import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';

class Routes {
  static const String indexScreen = '/';
  static const String homeScreen = '/home';
  static const String questionsScreen = '/questions-screen';
  static const String quizConfigurationScreen = '/quiz-config';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      indexScreen: (context) => IndexScreen(),
      homeScreen: (context) => HomeScreen(),
      questionsScreen: (context) => QuestionsScreen(),
    };
  }
}
