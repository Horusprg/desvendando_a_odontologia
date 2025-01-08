class GeminiPrompt {
  int questionQuantity;
  String questionModule;

  GeminiPrompt({
    required this.questionQuantity,
    required this.questionModule,
  });

  build () {
    return '''
    Gere $questionQuantity pergunta(s) de quiz sobre $questionModule com 5 alternativas de resposta.
    Responda conforme o seguinte JSON:
    
    {
      "question": "Qual é a capital do Brasil?",
      "correctAnswer": "Brasília",
      "explanation": "Brasília é a capital do Brasil desde 1960.",
      "incorrectAnswers": [
        "Rio de Janeiro",
        "São Paulo",
        "Belo Horizonte"
      ]
    }
     ''';
  }

}