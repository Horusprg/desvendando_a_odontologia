import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';

class QuizSetupDialog extends StatelessWidget {

  final LearnModuleTypeEnum module;


  const QuizSetupDialog({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    int questionQuantity = 5;
    LearnModuleTypeEnum selectedModule = module;
    QuestionTypeEnum selectedQuestionType = QuestionTypeEnum.multipleChoice;
    DifficultyEnum selectedDifficulty = DifficultyEnum.easy;
    String selectedTopic = module.topics[0];

    return AlertDialog(
      title: Text("Opções do Quiz"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quantidade de perguntas"),
            StatefulBuilder(
              builder: (context, setState) {
                return Slider(
                  value: questionQuantity.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: questionQuantity.toString(),
                  onChanged: (value) {
                    setState(() {
                      questionQuantity = value.toInt();
                    });
                  },
                );
              },
            ),
            // DropdownButtonFormField<LearnModuleTypeEnum>(
            //   value: selectedModule,
            //   items: LearnModuleTypeEnum.values.map((m) {
            //     return DropdownMenuItem(value: m, child: Text(m.name));
            //   }).toList(),
            //   onChanged: (value) {
            //     selectedModule = value!;
            //   },
            //   decoration: InputDecoration(labelText: "Módulo"),
            // ),
            DropdownButtonFormField<QuestionTypeEnum>(
              isExpanded: true,
              value: selectedQuestionType,
              items: QuestionTypeEnum.values.map((t) {
                return DropdownMenuItem(
                    value: t,
                    child: Text(
                      t.name,
                      textWidthBasis: TextWidthBasis.longestLine,
                      overflow: TextOverflow.ellipsis,
                    ));
              }).toList(),
              onChanged: (value) {
                selectedQuestionType = value!;
              },
              decoration: InputDecoration(labelText: "Tipo de Questão"),
            ),
            // DropdownButtonFormField<DifficultyEnum>(
            //   value: selectedDifficulty,
            //   items: DifficultyEnum.values.map((d) {
            //     return DropdownMenuItem(value: d, child: Text(d.name));
            //   }).toList(),
            //   onChanged: (value) {
            //     selectedDifficulty = value!;
            //   },
            //   decoration: InputDecoration(labelText: "Dificuldade"),
            // ),
            DropdownButtonFormField<String>(
              isExpanded: true,
              value: selectedTopic,
              items:
                  LearnModuleTypeEnum.odontology_breastfeeding.topics.map((d) {
                return DropdownMenuItem(value: d, child: Text(d));
              }).toList(),
              onChanged: (value) {
                selectedTopic = value!;
              },
              decoration: InputDecoration(labelText: "Tópico"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, {
              "questionQuantity": questionQuantity,
              "module": selectedModule,
              "questionType": selectedQuestionType,
              "difficulty": selectedDifficulty,
              "topic": selectedTopic,
            });
          },
          child: Text("Iniciar Quiz"),
        ),
      ],
    );
  }
}
