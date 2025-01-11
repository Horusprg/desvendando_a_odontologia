import '../models/question_model.dart';

class QuestionAdapter {
  static List<Question> fromJson(List<dynamic>? jsonObject) {
    if (jsonObject == null) {
      return [];
    }
    return jsonObject.map<Question>((json) => Question.fromJson(json)).toList();
  }
}
