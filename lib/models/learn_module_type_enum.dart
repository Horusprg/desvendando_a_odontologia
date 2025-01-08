enum LearnModuleTypeEnum {
  breastfeeding(name: 'Amamentação'),
  odontology(name: 'Odontologia'),
  buccalHealth(name: 'Saúde Bucal');

  const LearnModuleTypeEnum({required this.name});

  final String name;
}