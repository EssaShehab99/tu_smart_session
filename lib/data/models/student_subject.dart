class StudentSubject{
  int id;
  int section;
  bool taken;

  StudentSubject({required this.id, required this.section,required this.taken});

  factory StudentSubject.fromJson(Map<String, dynamic> json) {
    return StudentSubject(
      id: json["id"],
      section: json["section"],
      taken: json["taken"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "section": section,
      "taken": taken,
    };
  }
//

}