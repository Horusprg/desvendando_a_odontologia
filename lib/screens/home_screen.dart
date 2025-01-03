import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
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
          ),
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Title
                Text(
                  'Olá, Marilene', // TODO: Adicionar nome do usuário pela base de dados
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.blue[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Olá, seja bem-vindo!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
          // Footer
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              'Todos os direitos reservados.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
