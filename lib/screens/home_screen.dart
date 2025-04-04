import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/difficulty_enum.dart';
import '../models/learn_module_type_enum.dart';
import '../models/question_type_enum.dart';
import '../widgets/cards.dart';
import '../widgets/circular_progress.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/quiz_setup_dialog.dart';
import '../services/database_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Carregando...";
  int completedQuizzes = 0;
  int completedModules = 0;
  int progress = 0;
  int progressRandom = 0;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      Map<String, dynamic> userData = await DatabaseService.getUserData();
      setState(() {
        userName = userData['name'] ?? "Usuário sem nome";

        // Lista de todos os tópicos/módulos disponíveis
        final List<String> topics = [
          'progressImportanciaAmamentacao',
          'progressAmamentacaoOdontologia',
          'progressDesmamePrecoce',
          'progressSaudeBucal',
          'progressMitosCrencas',
          'progressSaudePeriodontal',
          'progressImportanciaPrenatal'
        ];

        // Calcula a soma de todos os progressos e conta módulos completos
        int totalProgress = 0;
        int completedModulesCount = 0;

        for (final topic in topics) {
          progress = userData[topic] ?? 0;
          totalProgress += progress;

          // Considera completo se progresso for 10 (100%)
          if (progress == 10) {
            completedModulesCount++;
          }
        }

        completedQuizzes = totalProgress;
        completedModules = completedModulesCount;

        progressRandom = ((userData['progressRandom'] ?? 0) / 20).toInt();
      });
    } catch (e) {
      setState(() {
        userName = "Erro ao buscar nome";
      });
      if (kDebugMode) {
        print("Erro ao buscar o usuário: $e");
      }
    }
  }

  void _startQuiz(
      int questionQuantity,
      LearnModuleTypeEnum selectedModule,
      QuestionTypeEnum selectedQuestionType,
      DifficultyEnum selectedDifficulty,
      String questionTopic,
      String questionSubtopic) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestionsScreen(
          quantity: questionQuantity,
          module: selectedModule,
          difficulty: DifficultyEnum.easy,
          type: selectedQuestionType,
          topic: questionTopic,
          subtopic: questionSubtopic,
          dbRef: 'progressRandom',
        ),
      ),
    );
  }

  Future<void> _showQuizDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const QuizSetupDialog(),
    );

    if (!context.mounted) return;

    if (result != null) {
      _startQuiz(
        result["questionQuantity"],
        result["module"],
        result["questionType"],
        result["difficulty"],
        result["topic"],
        result["subtopic"],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Fundo principal
          Positioned.fill(
            child: Container(
              color: Colors.blue[100],
            ),
          ),
          // Retângulo principal baseado no SVG
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.035,
            right: screenWidth * 0.035,
            bottom: screenHeight * 0.025,
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, $userName!',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'O que você vai aprender hoje?',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, size: 28),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  // Módulos
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribui os cards uniformemente
                      children: [
                        Expanded(
                          child: ModuleCardWidget(
                            title: 'Saúde Bucal da Gestante',
                            imagePath: 'assets/module_saude_gestante.png',
                            onPressed: () async {
                              Navigator.pushReplacementNamed(
                                  context, '/modulo-saude-gestante');
                            },
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Espaçamento entre os módulos
                        Expanded(
                          child: ModuleCardWidget(
                            title: 'Amamentação e Odontologia',
                            imagePath:
                                'assets/module_amamentacao_odontologia.png',
                            onPressed: () async {
                              Navigator.pushReplacementNamed(
                                  context, '/modulo-amamentacao');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Quiz
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: const Icon(Icons.quiz, size: 40),
                      title: const Text('Quiz aleatório',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Perguntas aleatórias'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _showQuizDialog(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Estatísticas
                  _statisticsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _statisticsSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Estatísticas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.0,
                children: [
                  Column(spacing: 10, children: [
                    const Text(
                      'Progresso\nnos Módulos',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    CircularProgressWidget(
                        current: completedQuizzes,
                        total: 70,
                        color: AppColors.primary),
                  ]),
                  Column(spacing: 10, children: [
                    const Text(
                      'Módulos\nCompletos',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    CircularProgressWidget(
                        current: completedModules,
                        total: 10,
                        color: AppColors.green),
                  ]),
                  Column(spacing: 10, children: [
                    const Text(
                      'Progresso\ndos Quizzes\nAleatórios',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${(progressRandom * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRose,
                          fontFamily: 'Rosario'),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
