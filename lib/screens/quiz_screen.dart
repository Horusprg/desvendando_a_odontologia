import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  double _progress = 0.0;

  void _nextQuestion() {
    setState(() {
      if (_progress < 1.0) {
        _progress += 0.2; // Incrementa o progresso (20% a cada pergunta)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Progresso do Quiz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: _progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text('Próxima Pergunta'),
            ),
          ],
        ),
      ),
    );
  }
}
