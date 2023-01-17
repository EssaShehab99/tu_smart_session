import 'package:cloud_firestore/cloud_firestore.dart';

class UniversityCard {
  int id;
  String department;
  String name;
  String? college;
  String? academicDegree;
  String? email;
  DocumentReference<Map<String, dynamic>>? documentReference;

  UniversityCard(
      {required this.id,
      required this.department,
      required this.name,
      this.documentReference,
      this.academicDegree,
      this.college,
      this.email,});

  factory UniversityCard.fromJson(Map<String, dynamic> json,
      {DocumentReference<Map<String, dynamic>>? reference}) {
    return UniversityCard(
      documentReference: reference,
      id: json["id"],
      department: json["department"],
      name: json["name"],
      academicDegree: json["academic-degree"],
      college: json["college"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "department": department,
      "name": name,
      "academic-degree": academicDegree,
      "college": college,
      "email": email,
    };
  }
}
