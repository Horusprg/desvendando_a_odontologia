import 'package:desvendando_a_odontologia/core/dimensions.dart';
import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:desvendando_a_odontologia/models/feedback.dart';
import 'package:desvendando_a_odontologia/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizResultStatsWidget extends StatelessWidget {
  final Map<int, String> selectedAnswers;
  final List<Question> questions;

  const QuizResultStatsWidget({
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

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressWidget(
              current: correctAnswers,
              total: questions.length,
              color: AppColors.primary,
            ),
            SizedBox(width: AppDimensions.spacingMedium),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Você acertou $correctAnswers de ${questions.length}!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    QuizFeedback.getFeedback(correctAnswers / questions.length).message,
                    softWrap: true,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Ação para refazer o quiz
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "Refazer Quiz",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(),
//                 Text('RESULTADO',
//                   style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: 1.6,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.close, size: 30,),
//
//                 )
//               ],
//             ),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircularProgressWidget(current: correctAnswers, total: questions.length,),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: questions.length,
//                 itemBuilder: (context, index) {
//                   final question = questions[index];
//                   final selectedAnswer = selectedAnswers[index];
//                   final isCorrect = selectedAnswer == question.correctAnswer;
//
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     child: ListTile(
//                       title: Text(question.question),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Sua resposta: ${selectedAnswer ?? "Not answered"}'),
//                           Text('Resposta correta: ${question.correctAnswer}'),
//                           Text('Explicação: ${question.explanation}'),
//                         ],
//                       ),
//                       tileColor: isCorrect ? Colors.green[50] : Colors.red[50],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
  }
}
