import 'package:desvendando_a_odontologia/core/typography.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.white,
          dismissible: false,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16), // Espaçamento entre o ícone e o texto
              Text(
                "Carregando perguntas...",
                style: AppTypography.caption,
              ),
            ],
          )
        ),
      ],
    );
  }
}