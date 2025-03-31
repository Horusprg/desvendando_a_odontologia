import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:desvendando_a_odontologia/models/difficulty_enum.dart';
import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/models/question_model.dart';
import 'package:desvendando_a_odontologia/models/question_type_enum.dart';
import 'package:desvendando_a_odontologia/repository/in/gemini_prompt.dart';
//import 'package:desvendando_a_odontologia/repository/out/gemini_response.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../adapters/question_adapter.dart';

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
          items:
              Schema.string(description: 'Resposta incorreta.', nullable: true))
    }, requiredProperties: [
      'question',
      'correct_answer',
      'explanation',
      'incorrect_answers'
    ]));

class GeminiClient {
  late final String apiKey;
  late final GenerativeModel model;

  GeminiClient(this.apiKey) {
    if (apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY não encontrada no arquivo .env');
    }

    model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
            responseMimeType: 'application/json',
            responseSchema: questionSchema));
  }

  Future<List<Question>> getQuestions(
      {required int questionQuantity,
      required DifficultyEnum questionDifficulty,
      required LearnModuleTypeEnum questionModule,
      required QuestionTypeEnum questionType,
      required String questionTopic}) async {
    try {
      GeminiPrompt geminiPrompt = GeminiPrompt(
          questionQuantity: questionQuantity,
          questionDifficulty: questionDifficulty.name,
          questionModule: questionModule.name,
          questionType: questionType.name,
          questionTopic: questionTopic);

      final prompt = geminiPrompt.toString();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Check if response is null or empty
      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from API');
      }

      // Parse response safely
      try {
        final jsonResponse = jsonDecode(response.text!);
        return QuestionAdapter.fromJson(jsonResponse);
      } catch (e) {
        throw Exception('Invalid JSON format: ${e.toString()}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on Exception catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
