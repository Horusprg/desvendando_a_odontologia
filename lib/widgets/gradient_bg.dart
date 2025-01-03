import 'package:flutter/material.dart';

class GradientBgWidget extends StatelessWidget {
  const GradientBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // Gradient Overlay
        Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF9BC2FC), // Cor inicial
            Color(0xFFD6E6FF), // Cor final
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter, // Direção do gradiente
        ),
      ),
    );
  }
}
