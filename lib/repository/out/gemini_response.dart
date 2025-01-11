import 'dart:convert';

class GeminiResponse {
  static List<dynamic>? responseToJSON({String? response}) {
    try {
      return jsonDecode(response.toString());
    } catch (e) {
      return null;
    }
  }
}