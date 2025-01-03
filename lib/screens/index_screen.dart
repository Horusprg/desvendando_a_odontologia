import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.png'), // Add your background image here
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
                        0.7, // 70% da largura da tela,
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
                          color: Colors.black.withValues(alpha: 0.2),
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
                      onPressed: () {
                        if (_nameController.text.isEmpty) {
                          // Exibe uma mensagem de erro no Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Por favor, insira seu nome')),
                          );
                        } else {
                          // TODO: Inserir o nome do usuário na base de dados e criar um token de acesso (para progresso do usuário)
                          // Prossegue para a próxima tela
                          Navigator.pushNamed(context, '/home');
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
