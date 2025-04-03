import 'package:desvendando_a_odontologia/screens/lessons/lesson_amamentacao.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_anquiloglossia.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_beneficios_aleitamento.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_chupeta.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_composicao_leite.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_denticao.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_desmame.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_estomatognatico.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_maloclusao.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_respiracao.dart';
import 'package:desvendando_a_odontologia/screens/lessons/lesson_tipos_aleitamento.dart';
import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'screens/home_screen.dart';
import 'screens/modulo_amamentacao.dart';
import 'screens/modulo_saude_bucal_gestante.dart';
import 'screens/quiz_modulo_amamentacao.dart';
import 'screens/quiz_modulo_saude_bucal_gestante.dart';
import 'screens/statistic_screen.dart';

class Routes {
  static const String indexScreen = '/';
  static const String homeScreen = '/home';
  static const String questionsScreen = '/questions-screen';
  static const String quizConfigurationScreen = '/quiz-config';
  static const String moduloAmamentacaoScreen = '/modulo-amamentacao';
  static const String moduloSaudeGestanteScreen = '/modulo-saude-gestante';
  static const String quizAmamentacaoScreen = '/quiz-modulo-amamentacao';
  static const String quizSaudeGestanteScreen = '/quiz-modulo-saude-gestante';
  static const String quizSetupScreen = '/quiz-setup';
  static const String statisticsScreen = '/stats';
  static const String amamentacaoScreen = '/lesson-amamentacao';
  static const String tiposAleitamentoScreen = '/lesson-tipos-aleitamento';
  static const String composicaoLeiteScreen = '/lesson-composicao-leite';
  static const String beneficiosAleitamentoScreen = "/lesson-beneficios-aleitamento";
  static const String estomatognaticoScreen = "/lesson-estomatognatico";
  static const String denticaoScreen = "/lesson-desenvolvimento-denticao";
  static const String anquiloglossiaScreen = "/lesson-anquiloglossia";
  static const String saudeBucalMamameScreen = "/lesson-saude-mamae";
  static const String mitosScreen = "/lesson-mitos";
  static const String preEclampsiaScreen = "/lesson-eclampsia";
  static const String baixoPesoScreen = "/lesson-baixo-peso";
  static const String prematuroScreen = "/lesson-prematuro";
  static const String preNatalScreen = "/lesson-pre-natal";
  static const String desmamePrecoceScreen = "/lesson-desmame";
  static const String chupetaScreen = "/lesson-chupeta";
  static const String maloclusaoScreen = "/lesson-maloclusao";
  static const String respiracaoBucalScreen = "/lesson-respiracao-bucal";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      indexScreen: (context) => IndexScreen(),
      homeScreen: (context) => HomeScreen(),
      moduloAmamentacaoScreen: (context) => ModuloAmamentacaoScreen(),
      moduloSaudeGestanteScreen: (context) => ModuloSaudeGestanteScreen(),
      quizAmamentacaoScreen: (context) => QuizAmamentacaoScreen(),
      quizSaudeGestanteScreen: (context) => QuizSaudeGestanteScreen(),
      statisticsScreen: (context) => StatisticsScreen(),
      amamentacaoScreen: (context) => AmamentacaoLessonScreen(),
      tiposAleitamentoScreen: (context) => TiposAleitamentoLessonScreen(),
      composicaoLeiteScreen : (context) => ComposicaoLeiteLessonScreen(),
      beneficiosAleitamentoScreen : (context) => BeneficiosAleitamentoLessonScreen(),
      estomatognaticoScreen: (context) => EstomatognaticoLessonScreen(),
      desmamePrecoceScreen: (context) => DesmameLessonScreen(),
      chupetaScreen: (context) => ChupetaLessonScreen(),
      maloclusaoScreen: (context) => MaloclusaoLessonScreen(),
      respiracaoBucalScreen: (context) => RespiracaoLessonScreen(),
      denticaoScreen: (context) => DenticaoLessonScreen(),
      anquiloglossiaScreen: (context) => AnquiloglossiaLessonScreen(),
      // quizSetupScreen: (context) => QuizSetupScreen(),
    };
  }
}

