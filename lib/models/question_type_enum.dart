enum QuestionTypeEnum {
  multipleChoice(name: 'Múltipla escolha com 5 alternativas.'),
  trueFalse(name: 'Verdadeiro ou falso.'),
  matching(name: 'Correspondência.'),
  multipleResponse(name: 'Múltipla resposta.'),
  fillInTheBlanks(name: 'Preenchimento de lacunas.');

  const QuestionTypeEnum({required this.name});

  final String name;
}