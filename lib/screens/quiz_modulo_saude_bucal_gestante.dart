import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/linear_progress.dart';
import '../widgets/quiz_module_card.dart';
import '../core/theme.dart';

class QuizSaudeGestanteScreen extends StatefulWidget {
  const QuizSaudeGestanteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizSaudeGestanteState();
  }
}

class _QuizSaudeGestanteState extends State<QuizSaudeGestanteScreen> {
  Widget activeScreen = const QuizSaudeGestanteScreen();

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
                          QuizModuleCardButtonWidget(
                            text: 'Saúde Bucal da Mamãe',
                            onPressed: () {},
                            imagePath: 'assets/cards/fig-4.png',
                            color: AppColors.rose,
                            progress: 0.5,
                            lenQuiz: 20,
                          ),
                          QuizModuleCardButtonWidget(
                            text:
                                'Mitos e Crenças sobre Gravidez e Saúde Bucal',
                            onPressed: () {},
                            imagePath: 'assets/cards/fig-2.png',
                            color: AppColors.rose,
                            progress: 0.5,
                            lenQuiz: 20,
                          ),
                          QuizModuleCardButtonWidget(
                            text: 'Saúde Periodontal e Gravidez',
                            onPressed: () {},
                            imagePath: 'assets/cards/fig-3.png',
                            color: AppColors.rose,
                            progress: 0.5,
                            lenQuiz: 20,
                          ),
                          QuizModuleCardButtonWidget(
                            text: 'A Importância do Pré-Natal Odontológico',
                            onPressed: () {},
                            imagePath: 'assets/cards/fig-1.png',
                            color: AppColors.rose,
                            progress: 0.5,
                            lenQuiz: 20,
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
