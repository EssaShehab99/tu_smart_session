import 'package:flutter/foundation.dart';
import '/data/models/user.dart';
import '/data/local/sharedpref_helper/preferences.dart';
import '/data/models/question.dart';
import '/data/network/api/ask_cody_api.dart';
import '/data/network/data_response.dart';

class AskCodyRepository {
  final AskCodyApi _askCodyApi;
  final _preferences = Preferences.instance;
  AskCodyRepository(this._askCodyApi);

  Future<Result> getQuestions(User? user) async {
    debugPrint("==========AskCodyRepository->getQuestions->|| ==========");
    try {
      final response = await _askCodyApi.getQuestions();
      final questions =
          response.map((e) => Question.fromJson(e.data())).toList();
      Question welcomeQuestion =
          questions.firstWhere((element) => element.id == 1);
      welcomeQuestion.question = welcomeQuestion.question.replaceAll(
          RegExp(r'name'), user?.universityCard?.name.split(" ").first ?? "");
      questions.sort((a, b) => a.id.compareTo(b.id));
      return Success(questions);
    } catch (e) {
      return Error(e);
    }
  }
}
