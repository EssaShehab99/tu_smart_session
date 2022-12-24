class Question {
  int id;
  String question;
  String? answer;
  bool myMessage;
  bool clickAble;
  int group;


  Question({required this.id,required this.group,required this.question, this.answer, required this.myMessage, required this.clickAble});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      group: json["group"],
      myMessage: json["my-message"]??false,
      clickAble: json["click-able"]??false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "answer": answer,
      "myMessage": myMessage,
      "clickAble": clickAble,
      "group": group,
    };
  }
}
