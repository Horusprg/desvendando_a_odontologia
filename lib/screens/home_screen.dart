import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/cards.dart';
import '../widgets/circular_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Carregando...";
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref("users");

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

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
      if (kDebugMode) {
        print("Erro ao buscar nome do usuário: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Fundo principal
          Positioned.fill(
            child: Container(
              color: Colors.blue[100],
            ),
          ),
          // Retângulo principal baseado no SVG
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.025,
            right: screenWidth * 0.025,
            bottom: screenHeight * 0.025,
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, $userName',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'O que você vai aprender hoje?',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, size: 28),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  // Módulos
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribui os cards uniformemente
                      children: [
                        Expanded(
                          child: ModuleCardWidget(
                            title: 'Saúde Bucal da Gestante',
                            imagePath: 'assets/module_saude_geestante.png',
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Espaçamento entre os módulos
                        Expanded(
                          child: ModuleCardWidget(
                            title: 'Amamentação e Odontologia',
                            imagePath:
                                'assets/module_amamentacao_odontologia.png',
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Quiz
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: const Icon(Icons.quiz, size: 40),
                      title: const Text('Quiz aleatório',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: const Text('20 perguntas aleatórias'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Estatísticas
                  _statisticsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _statisticsSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Estatísticas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.0,
              children: [
                Column(spacing: 10, children: [
                  const Text(
                    'Quizzes\nCompletos',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  CircularProgressWidget(
                      current: 30, total: 50, color: AppColors.primary),
                ]),
                Column(spacing: 10, children: [
                  const Text(
                    'Módulos\nCompletos',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  CircularProgressWidget(
                      current: 4, total: 10, color: AppColors.green),
                ]),
                Column(spacing: 25, children: [
                  const Text(
                    'Média de\nAcertos',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '80%',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.rose,
                        fontFamily: 'Rosario'),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
