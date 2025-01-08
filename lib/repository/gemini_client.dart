import 'package:desvendando_a_odontologia/models/learn_module_type_enum.dart';
import 'package:desvendando_a_odontologia/repository/in/gemini_prompt.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = String.fromEnvironment('GEMINI_API_KEY', defaultValue: "NO_KEY");

// TODO: Transformar em classe

void main() async {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: apiKey,
  );
  int questionQuantity = 5;

  GeminiPrompt geminiPrompt = GeminiPrompt(
      questionQuantity: questionQuantity,
      questionModule: LearnModuleTypeEnum.breastfeeding.name);

  final prompt = geminiPrompt.build();
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  print(response.text);

}