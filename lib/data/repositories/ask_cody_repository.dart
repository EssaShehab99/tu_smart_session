import 'package:flutter/foundation.dart';
import 'package:tu_smart_session/data/models/section.dart';
import '/data/models/subject.dart';
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
          response.map((e) => Questions.fromJson(e.data())).toList();
      Questions welcomeQuestion =
          questions.firstWhere((element) => element.id == 1);
      welcomeQuestion.question = welcomeQuestion.question.replaceAll(
          RegExp(r'name'), user?.universityCard?.name.split(" ").first ?? "");
      questions.sort((a, b) => a.id.compareTo(b.id));
      return Success(questions);
    } catch (e) {
      return Error(e);
    }
  }
  Future<Result> getSubject(String id) async {
    debugPrint("==========AskCodyRepository->getSubject->|| ==========");
    try {
      final response = await _askCodyApi.getSubject(id);
      final subject =Subject.fromJson(response.first.data());
      return Success(subject);
    } catch (e) {
      return Error(e);
    }
  }
  Future<Result> getSection(String id) async {
    debugPrint("==========AskCodyRepository->getSubject->|| ==========");
    try {
      final response = await _askCodyApi.getSection(id);
      final section =Section.fromJson(response.first.data());
      return Success(section);
    } catch (e) {
      return Error(e);
    }
  }
  Future<Result> request(Map<String,dynamic> form) async {
    debugPrint("==========AskCodyRepository->requestEdit->|| ==========");
    try {
      final response = await _askCodyApi.request(form);
      return Success(response.id);
    } catch (e) {
      return Error(e);
    }
  }
}
