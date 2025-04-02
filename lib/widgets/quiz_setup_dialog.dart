import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';

class QuizSetupDialog extends StatelessWidget {
  const QuizSetupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    int questionQuantity = 5;
    LearnModuleTypeEnum selectedModule = LearnModuleTypeEnum.odontologyBreastfeeding;
    QuestionTypeEnum selectedQuestionType = QuestionTypeEnum.multipleChoice;
    DifficultyEnum selectedDifficulty = DifficultyEnum.easy;
    String selectedTopic = selectedModule.topics.keys.first;
    List<String> selectedSubtopics = selectedModule.topics[selectedTopic] ?? [];
    String? selectedSubtopic = selectedModule.topics[selectedTopic]?.first ?? "";

    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Center(
        child: Text(
          "Opções do Quiz",
          style: TextStyle(
            fontFamily: 'Typodermic',
          ),
        ),
      ),
      content: StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quantidade de perguntas"),
                Slider(
                  value: questionQuantity.toDouble(),
                  min: 5,
                  max: 20,
                  divisions: 3,
                  label: questionQuantity.toString(),
                  onChanged: (value) {
                    setState(() {
                      questionQuantity = value.toInt();
                    });
                  },
                  activeColor: AppColors.primary,
                ),
                DropdownButtonFormField<LearnModuleTypeEnum>(
                  value: selectedModule,
                  items: LearnModuleTypeEnum.values.map((m) {
                    return DropdownMenuItem(value: m, child: Text(m.name));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedModule = value;
                        selectedTopic = value.topics.keys.first; // Pega a primeira chave do Map
                        selectedSubtopics = value.topics[selectedTopic] ?? []; // Atualiza os subtópicos
                      });
                    }
                  },
                  decoration: InputDecoration(labelText: "Módulo"),
                ),
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
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedQuestionType = value;
                      });
                    }
                  },
                  decoration: InputDecoration(labelText: "Tipo de Questão"),
                ),
                DropdownButtonFormField<DifficultyEnum>(
                  value: selectedDifficulty,
                  items: DifficultyEnum.values.map((d) {
                    return DropdownMenuItem(value: d, child: Text(d.name));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedDifficulty = value;
                      });
                    }
                  },
                  decoration: InputDecoration(labelText: "Dificuldade"),
                ),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: selectedTopic,
                  items: selectedModule.topics.keys.map((topicKey) {
                    return DropdownMenuItem(
                      value: topicKey,
                      child: Text(topicKey),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedTopic = value;
                      });
                    }
                  },
                  decoration: InputDecoration(labelText: "Tópico"),
                ),
                if (selectedSubtopics.isNotEmpty)
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: selectedSubtopic,
                    items: selectedSubtopics.map((subtopic) {
                      return DropdownMenuItem(
                        value: subtopic,
                        child: Text(subtopic),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSubtopic = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Selecione um subtópico',
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar", style: TextStyle(fontFamily: 'Typodermic')),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, {
              "questionQuantity": questionQuantity,
              "module": selectedModule,
              "questionType": selectedQuestionType,
              "difficulty": selectedDifficulty,
              "topic": selectedTopic,
              "subtopic": selectedSubtopic
            });
          },
          child: Text("Iniciar Quiz", style: TextStyle(fontFamily: 'Typodermic')),
        ),
      ],
    );
  }
}
