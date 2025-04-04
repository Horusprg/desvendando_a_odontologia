enum LearnModuleTypeEnum {
  odontologyBreastfeeding(name: 'Amamentação e Odontologia', topics: {
    "Importância da Amamentação": [
      "Amamentação",
      "Tipos de Aleitamento",
      "Composição do Leite",
      "Benefícios do Aleitamento"
    ],
    "Amamentação e Odontologia": [
      "O que é o sistema estomatognático?",
      "Desenvolvimento da primeira dentição",
      "Anquiloglossia e Fissuras Labiopalatais"
    ],
    "Desmame Precoce": [
      "O que é o desmame precoce e quais as suas causas?",
      "Uso de Chupeta e Mamadeira",
      "Tipos de Maloclusão",
      "Respiração Bucal"
    ]
  }),
  buccalHealth(name: 'Saúde Bucal da Gestante', topics: {
    "Saúde Bucal da Mamãe": [],
    "Mitos e Crenças sobre Gravidez e Saúde Bucal": [],
    "Doenças Periodontais e Complicações Obstétricas": [
      "Doenças Periodontais e Complicações Obstétricas",
      "Pré-eclâmpsia",
      "Baixo peso ao nascimento",
      "Parto prematuro"
    ],
    "A Importância do Pré-Natal Odontológico": []
  });

  const LearnModuleTypeEnum({required this.name, required this.topics});

  final String name;

  final Map<String, List<String>> topics;
}
