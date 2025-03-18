// import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
// import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
// import 'package:desvendando_a_odontologia/models/question_model.dart';
// import 'package:desvendando_a_odontologia/screens/quiz_questions_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../models/question_type_enum.dart';
// import '../repository/gemini_client.dart';
// import '../services/service_locator.dart';
//
// class QuizSetupScreen extends StatefulWidget {
//   const QuizSetupScreen({super.key});
//
//   @override
//   State createState() => _QuizSetupScreenState();
// }
//
// class _QuizSetupScreenState extends State<QuizSetupScreen> {
//   final geminiClient = getIt<GeminiClient>();
//   int questionQuantity = 10;
//   LearnModuleTypeEnum selectedModule = LearnModuleTypeEnum.odontology_breastfeeding;
//   QuestionTypeEnum selectedQuestionType = QuestionTypeEnum.multipleChoice;
//   DifficultyEnum selectedDifficulty = DifficultyEnum.medium;
//   String selectedTopic = LearnModuleTypeEnum.odontology_breastfeeding.topics[0];
//
//   late final DifficultyEnum difficulties;
//   late final LearnModuleTypeEnum modules;
//   late final QuestionTypeEnum types;
//
//   void _startQuiz() async {
//     try {
//       List<Question> questions = await geminiClient.getQuestions(
//           questionQuantity: 10,
//           questionDifficulty: selectedDifficulty,
//           questionModule: selectedModule,
//           questionType: selectedQuestionType,
//           questionTopic: selectedTopic
//       );
//
//       if (questions.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Erro ao carregar perguntas. Tente novamente."))
//         );
//         return;
//       }
//       print("🛠️ Iniciando quiz...");
//
//       if (!mounted) return;
//
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           // builder: (context) => QuestionsScreen(questions: questions, module: selectedModule),
//         ),
//       );
//
//     } catch (e) {
//       print("Erro ao iniciar o quiz: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Opções do Quiz")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Quantidade de perguntas"),
//             Slider(
//               value: questionQuantity.toDouble(),
//               min: 1,
//               max: 10,
//               divisions: 9,
//               label: questionQuantity.toString(),
//               onChanged: (value) {
//                 setState(() {
//                   questionQuantity = value.toInt();
//                 });
//               },
//             ),
//             DropdownButtonFormField<LearnModuleTypeEnum>(
//               value: selectedModule,
//               items: LearnModuleTypeEnum.values.map((m) {
//                 return DropdownMenuItem(value: m, child: Text(m.name));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedModule = value!;
//                 });
//               },
//               decoration: InputDecoration(labelText: "Módulo"),
//             ),
//             DropdownButtonFormField<QuestionTypeEnum>(
//               value: selectedQuestionType,
//               items: QuestionTypeEnum.values.map((t) {
//                 return DropdownMenuItem(value: t, child: Text(t.name));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedQuestionType = value!;
//                 });
//               },
//               decoration: InputDecoration(labelText: "Tipo de Questão"),
//             ),
//             DropdownButtonFormField<DifficultyEnum>(
//               value: selectedDifficulty,
//               items: DifficultyEnum.values.map((d) {
//                 return DropdownMenuItem(value: d, child: Text(d.name));
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedDifficulty = value!;
//                 });
//               },
//               decoration: InputDecoration(labelText: "Dificuldade"),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _startQuiz,
//                 child: Text("Iniciar Quiz"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
