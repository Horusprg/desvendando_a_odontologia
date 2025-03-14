import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/linear_progress.dart';

class QuizModuleCardButtonWidget extends StatelessWidget {
  final String text;
  final int lenQuiz;
  final String imagePath;
  final VoidCallback onPressed;
  final double progress;
  final Color color;

  const QuizModuleCardButtonWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
    required this.color,
    required this.progress,
    required this.lenQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.27,
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1,
                                  color: AppColors.text),
                            ),
                            Text(
                              '$lenQuiz perguntas',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Progresso',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.text),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              '${progress * 100}%',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        CustomProgressIndicator(
                          progress: progress,
                          color: color,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
