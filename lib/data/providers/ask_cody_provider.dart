import 'package:flutter/material.dart';
import '/data/models/user.dart';
import '/data/utils/extension.dart';
import '/data/models/question.dart';
import '/data/network/data_response.dart';
import '/data/repositories/ask_cody_repository.dart';
import '/data/di/service_locator.dart';

class AskCodyProvider extends ChangeNotifier {
  AskCodyProvider(this._user);
  final _askCodyRepository = getIt.get<AskCodyRepository>();
  final User? _user;
  List<Question> questions = [];
  List<int> distincts = [];

  Future<Result> getQuestions() async {
    if(questions.isNotEmpty) {
      return Success();
    }
    Result result = await _askCodyRepository.getQuestions(_user);
    if (result is Success) {
      questions = result.value;
      _distinct();
    }
    return result;
  }
  void _distinct(){
    distincts =
        questions.distinctBy((e) => e.group).map((e) => e.group).toList();
    distincts.sort((a, b) => a.compareTo(b));

  }

 void addQuestions(Question question){
   debugPrint("=========AskCodyProvider->addQuestions->question:${question.toJson()} =========");
   questions.add(question);
   _distinct();
   notifyListeners();
 }
}