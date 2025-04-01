import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/logo.dart';
import '../widgets/route_button.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userId;

  // Referência ao Firebase Realtime Database
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('users');

  @override
  void initState() {
    super.initState();
    verifyUser();
  }

  /// Verifica se o usuário já existe ou precisa ser autenticado anonimamente
  Future<void> verifyUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Cria um usuário anônimo caso não exista
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      user = userCredential.user;
    }

    if (user != null) {
      setState(() {
        userId = user!.uid;
      });

      // Se o usuário já existe e tem um nome, vai direto para /home
      DatabaseEvent event = await _dbRef.child(userId!).once();
      if (event.snapshot.exists) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Center(
            child: Form(
              key: _formKey, // Key for the form validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  LogoWidget(),
                  SizedBox(height: 20),
                  // Title
                  Text(
                    'Desvendando a Odontologia',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.blue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width *
                        0.7, // 70% da largura da tela
                    child: Divider(
                      thickness: 2,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    'Olá, seja bem-vindo!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  SizedBox(height: 30),
                  // Input Field
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Insira seu nome',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rosario',
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Buttons
                  RouteButtonWidget(
                      text: 'Entrar',
                      onPressed: () async {
                        String userName = _nameController.text.trim();

                        if (userName.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Por favor, insira seu nome antes de continuar.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        try {
                          if (userId == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Erro: ID do usuário não encontrado!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // Adiciona usuário ao Firebase Realtime Database
                          await _dbRef.child(userId!).set({
                            'name': userName,
                            'timestamp': DateTime.now().toIso8601String(),
                          });

                          // Exibe mensagem de sucesso
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Bem-vindo, $userName!'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Navega para a tela /home substituindo a tela atual
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        } on FirebaseException catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Erro no Firebase: ${e.message}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Erro ao salvar nome: ${e.toString()}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      })
                ],
              ),
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
                color: Colors.blue[900],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
