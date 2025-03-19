enum LearnModuleTypeEnum {
  odontologyBreastfeeding(name: 'Amamentação e Odontologia', topics: [
    "Importância da Amamentação",
    "Amamantação e Odontologia",
    "Desmame Precoce"
  ]),
  buccalHealth(name: 'Saúde Bucal da Gestante', topics: [
    "Saúde Bucal da Mamãe",
    "Mitos e Crenças sobre Gravidez e Saúde Bucal",
    "Saúde Periodontal e Gravidez",
    "A Importância do Pré-Natal Odontológico"
  ]);

  const LearnModuleTypeEnum({required this.name, required this.topics});

  final String name;

  final List<String> topics;
}
