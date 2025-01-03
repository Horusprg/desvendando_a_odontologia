import 'package:flutter/material.dart';

class RouteButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RouteButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(alpha: 0.2), // Cor e opacidade da sombra
            spreadRadius: 2, // Expansão da sombra
            blurRadius: 6, // Borrão
            offset: Offset(2, 4), // Deslocamento horizontal e vertical
          ),
        ],
        borderRadius: BorderRadius.circular(12), // Alinha com o botão
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Usa a ação passada como parâmetro
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}
