import 'package:desvendando_a_odontologia/core/typography.dart';
import 'package:desvendando_a_odontologia/widgets/quiz_result_stats.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/question_model.dart';
import '../services/database_service.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<int, String> selectedAnswers;
  final List<Question> questions;
  final String topic;
  final String dbRef;

  const QuizResultScreen(
      {super.key,
      required this.selectedAnswers,
      required this.questions,
      required this.topic,
      required this.dbRef});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }

    // Verificar e atualizar o score
    _checkAndUpdateScore(context, correctAnswers);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                SizedBox(),
                Text(
                  'Resultado do Quiz',
                  style: AppTypography.typodermic(
                    size: AppTypography.fontSizeMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  ),
                )
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuizResultStatsWidget(
                correctAnswers: correctAnswers, total: questions.length),
            const Divider(),
            Text("Respostas",
                style: AppTypography.typodermic(
                    size: AppTypography.fontSizeMedium)),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final selectedAnswer = selectedAnswers[index];
                final isCorrect = selectedAnswer == question.correctAnswer;

                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor:
                            isCorrect ? Colors.green[50] : Colors.red[50],
                        collapsedBackgroundColor:
                            isCorrect ? Colors.green[50] : Colors.red[50],
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${index + 1}."),
                                isCorrect
                                    ? Icon(Icons.check, color: Colors.green)
                                    : Icon(Icons.close, color: Colors.red),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                question.question,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          ListTile(
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Escolheu: $selectedAnswer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isCorrect ? Colors.green : Colors.red,
                                  ),
                                ),
                                if (!isCorrect)
                                  RichText(
                                    text: TextSpan(
                                      text: 'Resposta correta: ',
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: question.correctAnswer,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (question.explanation.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Explicação: ${question.explanation}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700]),
                                    ),
                                  ),
                              ],
                            ),
                            tileColor:
                                isCorrect ? Colors.green[50] : Colors.red[50],
                          ),
                        ]));
              },
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _checkAndUpdateScore(BuildContext context, int newScore) async {
    try {
      final userData = await DatabaseService.getUserData();

      final currentScore = userData[dbRef] ?? 0;

      if (newScore > currentScore) {
        // Atualiza no banco de dados
        await DatabaseService.updateUserData({
          dbRef: newScore,
        });

        // Mostra mensagem de sucesso
        Fluttertoast.showToast(
          msg: "Parabéns! Você aumentou seu score em $dbRef!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      // Mostra mensagem de erro se algo der errado
      Fluttertoast.showToast(
        msg: "Erro ao atualizar seu score. Tente novamente mais tarde.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
