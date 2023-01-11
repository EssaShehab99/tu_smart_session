import 'package:flutter/material.dart';
import 'package:tu_smart_session/data/models/section.dart';
import 'package:tu_smart_session/data/models/student_subject.dart';
import 'package:tu_smart_session/data/repositories/auth_repository.dart';
import '/data/models/subject.dart';
import '/data/models/user.dart';
import '/data/utils/extension.dart';
import '/data/models/question.dart';
import '/data/network/data_response.dart';
import '/data/repositories/ask_cody_repository.dart';
import '/data/di/service_locator.dart';

class AskCodyProvider extends ChangeNotifier {
  AskCodyProvider(this._user);
  final _askCodyRepository = getIt.get<AskCodyRepository>();
  final _authRepository = getIt.get<AuthRepository>();
  final User? _user;
  List<Questions> _questions = [];
  List<Questions> get questions =>
      _questions.where((element) => element.isDisplay).toList();
  List<int> distincts = [];
  bool isReadOnly = true;
  Subject? subject;
  Section? section;

  Future<Result> getQuestions() async {
    if (_questions.isNotEmpty) {
      return Success();
    }
    Result result = await _askCodyRepository.getQuestions(_user);
    if (result is Success) {
      _questions = result.value;
      // _distinct();
    }
    return result;
  }
  // void _distinct(){
  //   distincts =
  //       _questions.distinctBy((e) => e.group).map((e) => e.group).toList();
  //   distincts.sort((a, b) => a.compareTo(b));
  //
  // }

  void addQuestions(Questions question) {
    debugPrint(
        "=========AskCodyProvider->addQuestions->question:${question.id} =========");
    _questions = [..._questions, question];
    // _distinct();
    notifyListeners();
  }

  void repeatQuestions(List<int> ids) {
    debugPrint(
        "=========AskCodyProvider->repeatQuestions->question:${ids.toString()} =========");
    for (int id in ids) {
      _questions = [
        ..._questions,
        _questions.firstWhere((element) => element.id == id).from()
          ..isDisplay = true
      ];
    }
    // _distinct();
    notifyListeners();
  }

  void changeReadOnly(bool readOnly) {
    isReadOnly = readOnly;
    notifyListeners();
  }

  Future<Result> getSubject(String id) async {
    Result result = await _askCodyRepository.getSubject(id);
    if (result is Success) {
      subject = result.value;
    }
    return result;
  }

  Future<Result> getSection(String id) async {
    Result result = await _askCodyRepository.getSection(id);
    if (result is Success) {
      section = result.value;
    }
    return result;
  }

  Future<Result> checkSectionTime() async {
    List<Section> sections = [];
    if (subject?.requirement != null) {
      for (int reqSub in subject?.requirement ?? []) {
        if (_user?.studentSubjects
                ?.where(
                    (element) => element.id == reqSub || element.taken != true)
                .isNotEmpty ??
            false) {
          return Error("You must finish requirements");
        }
      }
    }
    for (StudentSubject studentSubject in _user?.studentSubjects ?? []) {
      Result result = await _askCodyRepository
          .getSection(studentSubject.section.toString());
      if (result is Success) {
        sections.add(result.value);
      }
    }
    for (var section in sections) {
      if (this.section?.time.isAfter(section.time) == true ||
          this.section?.time.isBefore(
                  section.time.add(Duration(hours: subject?.hours ?? 0))) ==
              true) {
        _user!.studentSubjects = [
          ...?_user!.studentSubjects,
          StudentSubject(
              id: subject!.id, section: this.section!.id, taken: false)
        ];
        return await _authRepository.updateUser(_user!);
      }
    }
    return Error("Please select another section");
  }
}
