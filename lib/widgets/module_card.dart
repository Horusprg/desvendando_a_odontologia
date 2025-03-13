import 'package:flutter/material.dart';
import '../core/theme.dart';

class ModuleCardButtonWidget extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;
  final Color color;

  const ModuleCardButtonWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width * 0.25,
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                        color: AppColors.text),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: double.infinity,
                    width: 50,
                    color: color,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
