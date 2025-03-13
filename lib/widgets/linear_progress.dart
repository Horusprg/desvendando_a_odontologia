import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double progress;
  final Color color;

  const CustomProgressIndicator(
      {super.key, required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0,
        end: progress,
      ),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, value, _) => LinearProgressIndicator(
        value: value,
        minHeight: 20,
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    );
  }
}
