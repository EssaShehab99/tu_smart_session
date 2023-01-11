import '/data/utils/enum.dart';

class Question {
  int id;
  String question;
  String? answer;
  bool myMessage;
  String? type;
  int group;

  Question({required this.id, required this.question, this.answer, required this.myMessage, this.type,required this.group});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      myMessage: json["myMessage"]??false,
      type: json["type"],
      group: json["group"],
    );
  }
//

}
