import 'package:desvendando_a_odontologia/core/dimensions.dart';
import 'package:desvendando_a_odontologia/core/typography.dart';
import 'package:flutter/material.dart';

// class QuizOption extends StatefulWidget {
//   final String text;
//   final VoidCallback onTap;
//
//   const QuizOption({super.key, required this.text, required this.onTap});
//
//   @override
//   State<StatefulWidget> createState() => _QuizOptionState();
// }
//
// class _QuizOptionState extends State<QuizOption> {
//
//   bool isPressed = false;
//
//   void _toggleOption() {
//     setState(() {
//       isPressed = !isPressed;
//     });
//     widget.onTap();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: _toggleOption,
//       splashColor: Theme.of(context).primaryColor,
//       splashFactory: NoSplash.splashFactory,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         margin: EdgeInsets.symmetric(vertical: 3),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade200, width: 2),
//           borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
//           color: Colors.white,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 widget.text,
//                 style: AppTypography.button,
//                 textAlign: TextAlign.justify,
//                 softWrap: true,
//                 overflow: TextOverflow.visible,
//               ),
//             ),
//             SizedBox(width: AppDimensions.spacingLarge),
//             Icon(
//               isPressed ? Icons.check_circle_outline : Icons.circle_outlined,
//               size: 30,
//               color: isPressed ? Colors.green : Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class QuizOption extends StatelessWidget {
  const QuizOption(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected});

  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      splashFactory: NoSplash.splashFactory,
      child: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadiusSmall),
                color: Color.fromRGBO(236, 144, 155, 0.3),
                // gradient: LinearGradient(
                //     colors: [Colors.red, Colors.white],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                // )
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
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(colors: [Colors.redAccent, Colors.purple]).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn, // Apply the gradient to the icon
                    child: Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white, // Icon color is overridden by the gradient
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                  Icon(Icons.circle_outlined,
                    size: 30,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
    );
  }
}
