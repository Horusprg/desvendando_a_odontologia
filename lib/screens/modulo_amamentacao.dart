import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/linear_progress.dart';
import '../widgets/module_card.dart';
import '../core/theme.dart';
import '../services/database_service.dart';

class ModuloAmamentacaoScreen extends StatefulWidget {
  const ModuloAmamentacaoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ModuloAmamentacaoState();
  }
}

class _ModuloAmamentacaoState extends State<ModuloAmamentacaoScreen> {
  Widget activeScreen = const ModuloAmamentacaoScreen();

  double progressImportanciaAmamentacao = 0.0;
  double progressAmamentacaoOdontologia = 0.0;
  double progressDesmamePrecoce = 0.0;
  double totalProgress = 0.0;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    Map<String, dynamic> userData = await DatabaseService.getUserData();
    try {
      setState(() {
        progressImportanciaAmamentacao =
            (userData['progressImportanciaAmamentacao'] ?? 0) / 10;
        progressAmamentacaoOdontologia =
            (userData['progressAmamentacaoOdontologia'] ?? 0) / 10;
        progressDesmamePrecoce = (userData['progressDesmamePrecoce'] ?? 0) / 10;
      });
      totalProgress = (progressImportanciaAmamentacao +
              progressAmamentacaoOdontologia +
              progressDesmamePrecoce) /
          3;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        totalProgress = 0.0;
      });
    }
  }

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
                                'Progresso Total',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '${(totalProgress * 100).toStringAsFixed(1)}%',
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
                              progress: totalProgress,
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
