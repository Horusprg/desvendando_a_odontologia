class Question {
  final String question;
  final String correctAnswer;
  final String explanation;
  final List<String> incorrectAnswers;

  Question({
    required this.question,
    required this.explanation,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      explanation: json['explanation'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'explanation': explanation,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }
}