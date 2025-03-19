import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';
import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
import 'package:desvendando_a_odontologia/widgets/quiz_setup_dialog.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/linear_progress.dart';
import '../widgets/module_card.dart';
import '../core/theme.dart';

class ModuloAmamentacaoScreen extends StatefulWidget {
  const ModuloAmamentacaoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ModuloAmamentacaoState();
  }
}

class _ModuloAmamentacaoState extends State<ModuloAmamentacaoScreen> {
  Widget activeScreen = const ModuloAmamentacaoScreen();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
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
                  height: screenHeight * 0.7,
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
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(20)),
                            child: Image.asset(
                              'assets/module_amamentacao_odontologia.png',
                              width: 180,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Módulo',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text),
                                textAlign: TextAlign.start,
                              ),
                              const Text(
                                'Amamentação e\nOdontologia',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Typodermic',
                                    fontWeight: FontWeight.w100,
                                    color: AppColors.text),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20, top: 15.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Progresso',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'X%',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.text),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: CustomProgressIndicator(
                              progress: 0.5,
                              color: AppColors.lightBlue,
                            ),
                          ),
                          ModuleCardButtonWidget(
                              text: 'Importância da Amamentação',
                              onPressed: () {},
                              imagePath: 'assets/cards/fig-1.png',
                              color: AppColors.lightBlue),
                          ModuleCardButtonWidget(
                              text: 'Amamantação e Odontologia',
                              onPressed: () {},
                              imagePath: 'assets/cards/fig-2.png',
                              color: AppColors.lightBlue),
                          ModuleCardButtonWidget(
                              text: 'Desmame Precoce',
                              onPressed: () {},
                              imagePath: 'assets/cards/fig-3.png',
                              color: AppColors.lightBlue),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.0,
                      children: [
                        // Quiz
                        Flexible(
                          fit: FlexFit.tight,
                          child: Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              // Ajusta espaçamento interno
                              leading: const Icon(Icons.quiz, size: 30),
                              title: const Text(
                                'Quizes',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow
                                    .ellipsis, // Evita que o texto quebre
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  size: 15.0),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/quiz-modulo-amamentacao');
                              },
                            ),
                          ),
                        ),
                        // Referências
                        Flexible(
                          fit: FlexFit.tight,
                          child: Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              leading: const Icon(Icons.book, size: 30),
                              title: const Text(
                                'Referências',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  size: 15.0),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/referencias-amamentacao');
                              },
                            ),
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
