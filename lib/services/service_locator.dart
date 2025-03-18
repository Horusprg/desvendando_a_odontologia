import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../repository/gemini_client.dart';


final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  // Register GeminiClient as a singleton
  getIt.registerSingleton<GeminiClient>(GeminiClient(apiKey));
}