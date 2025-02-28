import 'package:desvendando_a_odontologia/data/questions_dummy.dart';
import 'package:desvendando_a_odontologia/screens/quiz_result_screen.dart';
import 'package:flutter/material.dart';

import '../core/typography.dart';
import '../models/question_model.dart';
import '../widgets/quiz_option.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<int, String> selectedAnswers = {};
  final Map<int, List<String>> shuffledAnswers = {};

  double _progress = 0.0;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _shuffleAnswers();
  }

  void _shuffleAnswers() {
    for (int i = 0; i < questions.length; i++) {
      List<String> answers =
          questions[i].getShuffledAnswers();
      shuffledAnswers[i] = answers;
    }
  }

  void _handleOptionSelected(String answer) {
    setState(() {
      if (selectedAnswers[_currentQuestionIndex] == answer) {
        selectedAnswers.remove(_currentQuestionIndex);
      } else {
        selectedAnswers[_currentQuestionIndex] = answer;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
        _progress += 1 / questions.length;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizResultScreen(
            selectedAnswers: selectedAnswers,
            questions: questions
          ))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = questions[_currentQuestionIndex];
    final List<String> answers = shuffledAnswers[_currentQuestionIndex]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz de Amamentação',
          style: TextStyle(
              fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              LinearProgressIndicator(
                value: _progress,
                minHeight: 4,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.deepOrangeAccent),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pergunta ${_currentQuestionIndex + 1} de ${questions.length}",
                      style: AppTypography.caption,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentQuestion.question,
                      style: AppTypography.question,
                    ),
                    const SizedBox(height: 10),
                    ...answers.map((answer) {
                      bool isSelected =
                          selectedAnswers[_currentQuestionIndex] == answer;
                      return QuizOption(
                        onTap: () => _handleOptionSelected(answer),
                        text: answer,
                        isSelected: isSelected
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          selectedAnswers.containsKey(_currentQuestionIndex)
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: _nextQuestion,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor:
                          selectedAnswers.containsKey(_currentQuestionIndex)
                              ? Colors.black
                              : Colors.grey.shade400,
                      foregroundColor: Colors.white,
                      maximumSize: const Size(double.infinity, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Próximo'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
