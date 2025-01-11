class GeminiPrompt {
  int questionQuantity;
  String questionModule;
  String questionDifficulty;
  String questionType;

  GeminiPrompt({
    required this.questionQuantity,
    required this.questionDifficulty,
    required this.questionModule,
    required this.questionType,
  });

  build() {
    return '''
    Gere $questionQuantity pergunta(s) de quiz de nível $questionDifficulty sobre $questionModule de $questionType.
    ''';
  }
}
