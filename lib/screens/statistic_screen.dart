import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Use fl_chart para gráficos
import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:desvendando_a_odontologia/widgets/circular_progress.dart';
import 'package:desvendando_a_odontologia/widgets/bottom_navigation_bar.dart';
import 'package:desvendando_a_odontologia/services/database_service.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String userName = "Carregando...";
  int completedQuizzes = 0;
  int completedModules = 0;
  double progressRandom = 0;
  Map<String, int> moduleProgress = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic> userData = await DatabaseService.getUserData();
      setState(() {
        userName = userData['name'] ?? "Usuário";

        final List<String> topics = [
          'progressImportanciaAmamentacao',
          'progressAmamentacaoOdontologia',
          'progressDesmamePrecoce',
          'progressSaudeBucal',
          'progressMitosCrencas',
          'progressSaudePeriodontal',
          'progressImportanciaPrenatal'
        ];

        int totalProgress = 0;
        int completedModulesCount = 0;
        moduleProgress = {};

        for (final topic in topics) {
          int progress = userData[topic] ?? 0;
          totalProgress += progress;

          String moduleName = _getModuleName(topic);
          moduleProgress[moduleName] = progress;

          if (progress == 10) {
            completedModulesCount++;
          }
        }

        completedQuizzes = totalProgress;
        completedModules = completedModulesCount;
        progressRandom = (userData['progressRandom'] ?? 0) / 20;
      });
    } catch (e) {
      setState(() {
        userName = "Erro ao buscar dados";
      });
      debugPrint("Erro ao buscar dados do usuário: $e");
    }
  }

  String _getModuleName(String topic) {
    switch (topic) {
      case 'progressImportanciaAmamentacao':
        return 'Amamentação';
      case 'progressAmamentacaoOdontologia':
        return 'Amamentação e Odonto';
      case 'progressDesmamePrecoce':
        return 'Desmame Precoce';
      case 'progressSaudeBucal':
        return 'Saúde Bucal';
      case 'progressMitosCrencas':
        return 'Mitos/Crenças';
      case 'progressSaudePeriodontal':
        return 'Saúde Periodontal';
      case 'progressImportanciaPrenatal':
        return 'Pré-natal';
      default:
        return topic.replaceAll('progress', '');
    }
  }

  Widget _buildBarChart() {
    if (moduleProgress.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final labels = moduleProgress.keys.toList();
    final values = moduleProgress.values.map((e) => e.toDouble()).toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        gridData: FlGridData(show: true), // Desabilita a grid
        titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: Text('Perguntas Acertadas'),
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32), // Desabilita o título do eixo Y
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: false), // Desabilita o título do eixo X
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            )),
        borderData: FlBorderData(show: false), // Desabilita a borda
        barGroups: List.generate(
          labels.length,
          (i) => BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: values[i],
                color: AppColors.primary,
                width: 20,
              ),
            ],
          ),
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            maxContentWidth: MediaQuery.of(context).size.width * 0.6,
            getTooltipColor: (group) => AppColors.blue,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${labels[groupIndex]}: ${rod.toY}', // Exibe o nome da barra e seu valor
                TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              );
            },
          ),
          handleBuiltInTouches:
              true, // Ativa o hover/touch para mostrar a tooltip
        ),
        minY: 0,
        maxY: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.blue[100]),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.035,
            right: MediaQuery.of(context).size.width * 0.035,
            bottom: MediaQuery.of(context).size.height * 0.025,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Estatísticas de Progresso',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Resumo do progresso
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              'Seu Progresso Geral',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildStatCard(
                                  'Módulos\nCompletos',
                                  '$completedModules/7',
                                  AppColors.green,
                                ),
                                _buildStatCard(
                                  'Progresso\nTotal',
                                  '${((completedQuizzes / 70) * 100).toStringAsFixed(1)}%',
                                  AppColors.primary,
                                ),
                                _buildStatCard(
                                  'Quizzes\nAleatórios',
                                  '${(progressRandom * 100).toStringAsFixed(1)}%',
                                  AppColors.lightRose,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Gráfico de barras do progresso por módulo
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Progresso por Módulo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 300,
                              child: _buildBarChart(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Indicadores circulares
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              'Visualização Detalhada',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text('Módulos\nCompletos',
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: CircularProgressWidget(
                                        current: completedModules,
                                        total: 7,
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('Progresso\nTotal',
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: CircularProgressWidget(
                                        current: completedQuizzes,
                                        total: 70,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('Quizzes\nAleatórios',
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: CircularProgressWidget(
                                        current: (progressRandom * 20).toInt(),
                                        total: 20,
                                        color: AppColors.lightRose,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withAlpha(50),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
