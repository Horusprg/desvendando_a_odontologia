import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'screens/home_screen.dart';
import 'screens/modulo_amamentacao.dart';
import 'screens/modulo_saude_bucal_gestante.dart';
import 'screens/quiz_modulo_amamentacao.dart';
import 'screens/quiz_modulo_saude_bucal_gestante.dart';

class Routes {
  static const String indexScreen = '/';
  static const String homeScreen = '/home';
  static const String questionsScreen = '/questions-screen';
  static const String quizConfigurationScreen = '/quiz-config';
  static const String moduloAmamentacaoScreen = '/modulo-amamentacao';
  static const String moduloSaudeGestanteScreen = '/modulo-saude-gestante';
  static const String quizAmamentacaoScreen = '/quiz-modulo-amamentacao';
  static const String quizSaudeGestanteScreen = '/quiz-modulo-saude-gestante';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      indexScreen: (context) => IndexScreen(),
      homeScreen: (context) => HomeScreen(),
      questionsScreen: (context) => QuestionsScreen(),
      moduloAmamentacaoScreen: (context) => ModuloAmamentacaoScreen(),
      moduloSaudeGestanteScreen: (context) => ModuloSaudeGestanteScreen(),
      quizAmamentacaoScreen: (context) => QuizAmamentacaoScreen(),
      quizSaudeGestanteScreen: (context) => QuizSaudeGestanteScreen(),
    };
  }
}
