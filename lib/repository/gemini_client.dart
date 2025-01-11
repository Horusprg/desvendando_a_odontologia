import 'dart:io';

import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_model.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';
import 'package:desvendando_a_odontologia/repository/in/gemini_prompt.dart';
import 'package:desvendando_a_odontologia/repository/out/gemini_response.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../adapters/question_adapter.dart';

final apiKey = () {
  final apiKey = Platform.environment['GEMINI_API_KEY'];
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }
  return apiKey;
}();

final questionSchema = Schema.array(
    description: 'Lista de perguntas de quiz',
    items: Schema.object(properties: {
      "question":
          Schema.string(description: 'Enunciado da pergunta.', nullable: false),
      "correct_answer":
          Schema.string(description: 'Resposta correta.', nullable: false),
      "explanation": Schema.string(
          description: 'Explicação da resposta correta.', nullable: false),
      "incorrect_answers": Schema.array(
          description: 'Lista de respostas incorretas.',
          items: Schema.string(
              description: 'Resposta incorreta.', nullable: true))
    }, requiredProperties: [
      'question',
      'correct_answer',
      'explanation',
      'incorrect_answers'
    ]));

class GeminiClient {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: questionSchema));

  Future<List<Question>> getQuestions(
      int questionQuantity,
      DifficultyEnum questionDifficulty,
      LearnModuleTypeEnum questionModule,
      QuestionTypeEnum questionType) async {
    // TODO: Tratar erro de conexão, response errada

    GeminiPrompt geminiPrompt = GeminiPrompt(
        questionQuantity: questionQuantity,
        questionDifficulty: questionDifficulty.name,
        questionModule: questionModule.name,
        questionType: questionType.name);

    final prompt = geminiPrompt.build();
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    return QuestionAdapter.fromJson(GeminiResponse.responseToJSON(response: response.text));
  }
}

void main() async {
  GeminiClient geminiClient = GeminiClient();
  List<Question> questions =
      await geminiClient
          .getQuestions(
          5,
          DifficultyEnum.hard,
          LearnModuleTypeEnum.breastfeeding,
          QuestionTypeEnum.fillInTheBlanks);
  print(questions);
}
