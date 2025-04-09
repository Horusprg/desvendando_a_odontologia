import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';
import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/linear_progress.dart';
import '../widgets/quiz_module_card.dart';
import '../core/theme.dart';
import '../services/database_service.dart';

class QuizSaudeGestanteScreen extends StatefulWidget {
  const QuizSaudeGestanteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizSaudeGestanteState();
  }
}

class _QuizSaudeGestanteState extends State<QuizSaudeGestanteScreen> {
  Widget activeScreen = const QuizSaudeGestanteScreen();

  double progressSaudeBucal = 0.0;
  double progressMitosCrencas = 0.0;
  double progressSaudePeriodontal = 0.0;
  double progressImportanciaPrenatal = 0.0;
  double totalProgress = 0.0;

  Map<String, String> titleToDbRef = {
    "Saúde Bucal da Mamãe": "progressSaudeBucal",
    "Mitos e Crenças sobre Gravidez e Saúde Bucal": "progressMitosCrencas",
    "Doenças Periodontais e Complicações Obstétricas":
        "progressSaudePeriodontal",
    "A Importância do Pré-Natal Odontológico": "progressImportanciaPrenatal"
  };

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    Map<String, dynamic> userData = await DatabaseService.getUserData();
    try {
      setState(() {
        progressSaudeBucal = (userData['progressSaudeBucal'] ?? 0) / 10;
        progressMitosCrencas = (userData['progressMitosCrencas'] ?? 0) / 10;
        progressSaudePeriodontal =
            (userData['progressSaudePeriodontal'] ?? 0) / 10;
        progressImportanciaPrenatal =
            (userData['progressImportanciaPrenatal'] ?? 0) / 10;
      });
      totalProgress = (progressSaudeBucal +
              progressMitosCrencas +
              progressSaudePeriodontal +
              progressImportanciaPrenatal) /
          4;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        // Reseta todos os valores para 0 em caso de erro
        progressSaudeBucal = 0.0;
        progressMitosCrencas = 0.0;
        progressSaudePeriodontal = 0.0;
        progressImportanciaPrenatal = 0.0;
        totalProgress = 0.0;
      });
    }
  }

  void switchScreen() {
    setState(() {});
  }

  double getProgressForTopic(String dbRef) {
    switch (dbRef) {
      case 'progressSaudeBucal':
        return progressSaudeBucal;
      case 'progressMitosCrencas':
        return progressMitosCrencas;
      case 'progressSaudePeriodontal':
        return progressSaudePeriodontal;
      case 'progressImportanciaPrenatal':
        return progressImportanciaPrenatal;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Fundo principal
          Positioned.fill(
            child: Container(
              color: AppColors.lightBlue,
            ),
          ),
          Positioned(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(20.0),
                  height: screenHeight * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        )
                      ]),
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/transparent_module_saude_gestante.png'),
                          alignment: Alignment(0.7, 0),
                          fit: BoxFit.fitHeight,
                          opacity: 0.8,
                        ),
                        color: AppColors.rose,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Quiz',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.background),
                                      textAlign: TextAlign.start,
                                    ),
                                    const Text(
                                      'Saúde Bucal da Gestante',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.background),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Progresso Total',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.background),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '${(totalProgress * 100).toStringAsFixed(1)}%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.background),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 20, right: 20, top: 5),
                            child: CustomProgressIndicator(
                              progress: totalProgress,
                              color: AppColors.rose,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20, top: 15.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          ...LearnModuleTypeEnum.buccalHealth.topics.entries
                              .map((entry) {
                            final topicKey = entry.key;
                            final dbRef = titleToDbRef[topicKey];

                            return QuizModuleCardButtonWidget(
                              text: topicKey,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => QuestionsScreen(
                                      quantity: 10,
                                      difficulty: DifficultyEnum.medium,
                                      type: QuestionTypeEnum.fillInTheBlanks,
                                      module: LearnModuleTypeEnum.buccalHealth,
                                      topic: topicKey,
                                      subtopic:
                                          "", // Agora passamos a chave do tópico
                                      dbRef: dbRef,
                                    ),
                                  ),
                                );
                              },
                              imagePath:
                                  'assets/cards/fig-${LearnModuleTypeEnum.buccalHealth.topics.keys.toList().indexOf(topicKey) + 1}.png',
                              color: AppColors.rose,
                              progress: getProgressForTopic(dbRef!),
                              lenQuiz: 10,
                            );
                          }),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
