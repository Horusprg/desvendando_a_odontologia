enum QuizFeedback {
  veryLow(0, 0.0, 0.0,
      'Parece que este quiz foi um verdadeiro desafio para você. Mas não desanime! Cada erro é uma oportunidade de aprendizado. Que tal revisar o conteúdo e tentar novamente? Você tem potencial para melhorar! 💪'),
  low(1, 0.01, 0.4,
      'Você conseguiu algumas respostas certas! Isso já é um começo. Ainda há espaço para melhorar, então que tal revisar alguns conceitos e tentar mais uma vez? Com um pouco mais de atenção, tenho certeza de que seu resultado será ainda melhor! 🚀'),
  medium(2, 0.41, 0.6,
      'Bom trabalho! Você já entendeu uma boa parte do conteúdo, mas ainda pode melhorar. Revise os erros e tente novamente para reforçar o que aprendeu. Você está no caminho certo! 📚'),
  high(3, 0.61, 0.8,
      'Ótimo desempenho! Você está quase lá! Faltou pouco para acertar tudo. Revise os detalhes que ficaram para trás e da próxima vez, tenho certeza de que alcançará um resultado ainda melhor! 🔥'),
  veryHigh(4, 0.81, 1.0,
      'Incrível! Você mandou muito bem no quiz! Seu desempenho foi excelente e mostra que você domina bem o assunto. Continue assim e siga aprendendo cada vez mais! 🚀');

  final int level;
  final double minPercentage;
  final double maxPercentage;
  final String message;

  const QuizFeedback(
      this.level, this.minPercentage, this.maxPercentage, this.message);

  static QuizFeedback getFeedback(double scorePercentage) {
    return QuizFeedback.values.firstWhere(
      (feedback) =>
          scorePercentage >= feedback.minPercentage &&
          scorePercentage <= feedback.maxPercentage,
      orElse: () =>
          QuizFeedback.veryLow,
    );
  }
}
