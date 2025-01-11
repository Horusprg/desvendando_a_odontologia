enum DifficultyEnum {
  easy(name: 'Fácil'),
  medium(name: 'Médio'),
  hard(name: 'Difícil');

  const DifficultyEnum({required this.name});

  final String name;

}