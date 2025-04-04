import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/screens/quiz_result_screen.dart';
import 'package:desvendando_a_odontologia/widgets/loading.dart';
import 'package:flutter/material.dart';

import '../core/theme.dart';
import '../core/typography.dart';
import '../models/difficulty_enum.dart';
import '../models/question_model.dart';
import '../models/question_type_enum.dart';
import '../repository/gemini_client.dart';
import '../services/service_locator.dart';
import '../widgets/quiz_option.dart';

class QuestionsScreen extends StatefulWidget {
  final DifficultyEnum difficulty;
  final LearnModuleTypeEnum module;
  final String topic;
  final String subtopic;
  final int quantity;
  final QuestionTypeEnum type;
  final String? dbRef;

  const QuestionsScreen(
      {super.key,
      required this.quantity,
      required this.difficulty,
      required this.type,
      required this.topic,
      required this.subtopic,
      required this.module,
      required this.dbRef});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<int, String> selectedAnswers = {};
  final Map<int, List<String>> shuffledAnswers = {};
  final geminiClient = getIt<GeminiClient>();
  List<Question> questions = [];
  bool isLoading = true;

  double _progress = 0.0;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  void _shuffleAnswers() {
    for (int i = 0; i < questions.length; i++) {
      List<String> answers = questions[i].getShuffledAnswers();
      shuffledAnswers[i] = answers;
    }
  }

  void _fetchQuestions() async {
    try {
      List<Question> loadedQuestions = await geminiClient.getQuestions(
          questionQuantity: widget.quantity,
          questionDifficulty: widget.difficulty,
          questionModule: widget.module,
          questionType: widget.type,
          questionTopic: widget.topic,
          questionSubtopic: widget.subtopic);

      setState(() {
        questions = loadedQuestions;
        _shuffleAnswers();
        isLoading = false;
      });
    } catch (e) {
      e.toString();
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
            MaterialPageRoute(
                builder: (context) => QuizResultScreen(
                      selectedAnswers: selectedAnswers,
                      questions: questions,
                      topic: widget.topic,
                      dbRef: widget.dbRef!,
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingOverlay();
    }

    final Question currentQuestion = questions[_currentQuestionIndex];
    final List<String> answers = shuffledAnswers[_currentQuestionIndex]!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primary),
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
                          isSelected: isSelected);
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
                        Text(
                          'Próximo',
                          style: TextStyle(fontFamily: 'Typodermic'),
                        ),
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
