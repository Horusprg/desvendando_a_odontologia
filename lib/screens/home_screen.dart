import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/route_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Carregando..."; // Nome padrão antes da busca
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref("users");

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  /// Busca o nome do usuário no Firebase usando o UID do usuário autenticado anonimamente
  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        setState(() {
          userName = "Usuário não autenticado";
        });
        return;
      }

      String userId = user.uid;

      // Obtém os dados do usuário do Firebase
      DatabaseEvent event = await _dbRef.child(userId).once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<String, dynamic> userData =
            Map<String, dynamic>.from(snapshot.value as Map);
        setState(() {
          userName = userData['name'] ?? "Usuário sem nome";
        });
      } else {
        setState(() {
          userName = "Nome não encontrado";
        });
      }
    } catch (e) {
      setState(() {
        userName = "Erro ao buscar nome";
      });
      print("Erro ao buscar nome do usuário: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
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
                const SizedBox(height: 20),
                // Title
                Text(
                  'Olá, $userName', // Exibe o nome real do usuário
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.blue[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          RouteButtonWidget(
            text: 'Iniciar Quiz',
            onPressed: () {
              Navigator.pushNamed(context, '/quiz');
            },
          ),
          // Footer
          const Positioned(
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
