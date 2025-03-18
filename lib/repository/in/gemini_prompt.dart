class GeminiPrompt {
  int questionQuantity;
  String questionModule;
  String questionDifficulty;
  String questionType;
  String questionTopic;

  GeminiPrompt({
    required this.questionQuantity,
    required this.questionDifficulty,
    required this.questionModule,
    required this.questionType,
    required this.questionTopic
  });

  @override
  String toString() {
    return '''
    Gere $questionQuantity pergunta(s) de quiz de nível 
    $questionDifficulty sobre $questionModule do assunto $questionTopic de $questionType.
    ''';
  }
}
