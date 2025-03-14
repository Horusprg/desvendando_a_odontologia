import 'package:flutter/material.dart';

import '../core/dimensions.dart';
import '../core/typography.dart';

class QuizAlternative extends StatefulWidget {
  const QuizAlternative({super.key});

  @override
  QuizAlternativeState createState() => QuizAlternativeState();
}

class QuizAlternativeState extends State<QuizAlternative> {
  bool isSelected = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
      },
      child: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadiusSmall),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: AppTypography.button,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(width: AppDimensions.spacingLarge),
                  Icon(
                    Icons.check_circle_outline,
                    size: 30,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 196, 60, 60), width: 2),
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadiusSmall),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: AppTypography.button,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(width: AppDimensions.spacingLarge),
                  Icon(
                    Icons.circle_outlined,
                    size: 30,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
    );
  }
}
