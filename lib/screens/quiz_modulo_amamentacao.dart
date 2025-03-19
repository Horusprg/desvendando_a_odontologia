import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:flutter/material.dart';
import '../models/difficulty_enum.dart';
import '../models/learn_module_type_enum.dart';
import '../models/question_type_enum.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/linear_progress.dart';
import '../widgets/quiz_module_card.dart';
import '../core/theme.dart';

class QuizAmamentacaoScreen extends StatefulWidget {
  const QuizAmamentacaoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAmamentacaoState();
  }
}

class _QuizAmamentacaoState extends State<QuizAmamentacaoScreen> {
  Widget activeScreen = const QuizAmamentacaoScreen();

  void switchScreen() {
    setState(() {});
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
                const SizedBox(height: 15),
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
                              'assets/transparent_module_amamentacao_odontologia.png'),
                          alignment: Alignment(0.55, 0),
                          fit: BoxFit.fitHeight,
                          opacity: 0.8,
                        ),
                        color: AppColors.blue,
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
                                      'Amamentação e Odontologia',
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
                                  'Progresso',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.background),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  'X%',
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
                                bottom: 10.0, left: 20, right: 20),
                            child: CustomProgressIndicator(
                              progress: 0.5,
                              color: AppColors.blue,
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
                          QuizModuleCardButtonWidget(
                            text: 'Importância da Amamentação',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QuestionsScreen(
                                    quantity: 10,
                                    difficulty: DifficultyEnum.medium,
                                    type: QuestionTypeEnum.fillInTheBlanks,
                                    module: LearnModuleTypeEnum.odontologyBreastfeeding,
                                    topic: LearnModuleTypeEnum
                                        .odontologyBreastfeeding.topics[0],
                                  ),
                                ),
                              );
                            },
                            imagePath: 'assets/cards/fig-4.png',
                            color: AppColors.blue,
                            progress: 0.5,
                            lenQuiz: 10,
                          ),
                          QuizModuleCardButtonWidget(
                            text: 'Amamantação e Odontologia',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QuestionsScreen(
                                    quantity: 10,
                                    difficulty: DifficultyEnum.medium,
                                    type: QuestionTypeEnum.fillInTheBlanks,
                                    module: LearnModuleTypeEnum.odontologyBreastfeeding,
                                    topic: LearnModuleTypeEnum
                                        .odontologyBreastfeeding.topics[1],
                                  ),
                                ),
                              );
                            },
                            imagePath: 'assets/cards/fig-2.png',
                            color: AppColors.blue,
                            progress: 0.5,
                            lenQuiz: 10,
                          ),
                          QuizModuleCardButtonWidget(
                            text: 'Desmame Precoce',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QuestionsScreen(
                                    quantity: 10,
                                    difficulty: DifficultyEnum.medium,
                                    type: QuestionTypeEnum.fillInTheBlanks,
                                    module: LearnModuleTypeEnum.odontologyBreastfeeding,
                                    topic: LearnModuleTypeEnum
                                        .odontologyBreastfeeding.topics[2],
                                  ),
                                ),
                              );
                            },
                            imagePath: 'assets/cards/fig-3.png',
                            color: AppColors.blue,
                            progress: 0.5,
                            lenQuiz: 10,
                          ),
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
