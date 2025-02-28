import 'package:desvendando_a_odontologia/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/question_model.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<int, String> selectedAnswers;
  final List<Question> questions;

  const QuizResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {

    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }

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
            Text('RESULTADO',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, size: 30,),
                
            )
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressWidget(current: correctAnswers, total: questions.length,),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final selectedAnswer = selectedAnswers[index];
                  final isCorrect = selectedAnswer == question.correctAnswer;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(question.question),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sua resposta: ${selectedAnswer ?? "Not answered"}'),
                          Text('Resposta correta: ${question.correctAnswer}'),
                          Text('Explicação: ${question.explanation}'),
                        ],
                      ),
                      tileColor: isCorrect ? Colors.green[50] : Colors.red[50],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}