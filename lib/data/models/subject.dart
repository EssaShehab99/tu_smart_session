class Subject {
  int id;
  int hours;
  String name;
  List<int> sections;
  List<int>? requirement;

  Subject({required this.id, required this.hours, required this.name, required this.sections,this.requirement});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json["id"],
      hours: json["hours"],
      name: json["name"],
      sections: List<int>.from(json["sections"]).toList(),
      requirement: json["requirement"]==null?null:List<int>.from(json["requirement"]).toList(),
    );
  }
//

}
