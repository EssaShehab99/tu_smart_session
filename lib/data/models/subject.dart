import '/data/utils/enum.dart';

class Subject {
  int id;
  int hours;
  String name;
  List<int> sections;

  Subject({required this.id, required this.hours, required this.name, required this.sections});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json["id"],
      hours: json["hours"],
      name: json["name"],
      sections: List<int>.from(json["sections"]).toList(),
    );
  }
//

}
