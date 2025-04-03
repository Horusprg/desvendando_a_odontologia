import 'package:desvendando_a_odontologia/core/dimensions.dart';
import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:desvendando_a_odontologia/core/typography.dart';
import 'package:desvendando_a_odontologia/models/feedback.dart';
import 'package:desvendando_a_odontologia/widgets/circular_progress.dart';
import 'package:flutter/material.dart';

class QuizResultStatsWidget extends StatelessWidget {
  final int correctAnswers;
  final int total;

  const QuizResultStatsWidget({
    super.key,
    required this.correctAnswers,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressWidget(
              current: correctAnswers,
              total: total,
              color: AppColors.primary,
            ),
            SizedBox(width: AppDimensions.spacingMedium),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Você acertou $correctAnswers de $total!",
                    style: AppTypography.typodermic(
                        size: AppTypography.fontSizeLarge),
                  ),
                  SizedBox(height: 5),
                  Text(
                    QuizFeedback.getFeedback(correctAnswers / total).message,
                    softWrap: true,
                  ),
                  SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Ação para refazer o quiz
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //     backgroundColor: AppColors.primary,
                  //     foregroundColor: Colors.white,
                  //   ),
                  //   child: Text(
                  //     "Refazer Quiz",
                  //     textAlign: TextAlign.center,
                  //     style:
                  //         TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  //   ),
                  // )
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
