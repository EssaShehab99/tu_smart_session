class Questions {
  int id;
  String question;
  String? answer;
  bool myMessage;
  bool isDisplay;
  String? type;
  int group;
  int order;

  Questions(
      {required this.id,
      required this.question,
      this.answer,
      required this.myMessage,
      this.type,
      required this.group,
      required this.order,
      required this.isDisplay});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      myMessage: json["myMessage"] ?? false,
      type: json["type"],
      group: json["group"],
      order: json["order"],
      isDisplay: !(json["type"].toString().contains("dependent")||json["type"].toString().contains("url")),
    );
  }
  Questions from() {
    return Questions(
        id: id,
        question: question,
        myMessage: myMessage,
        group: group,
        type: type,
        order: order,
        answer: answer,
        isDisplay: isDisplay);
  }
}
