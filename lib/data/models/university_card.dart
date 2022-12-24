import 'package:cloud_firestore/cloud_firestore.dart';

class UniversityCard {
  int id;
  String department;
  String name;
  DocumentReference<Map<String, dynamic>>? documentReference;

  UniversityCard(
      {required this.id,
      required this.department,
      required this.name,
      this.documentReference});

  factory UniversityCard.fromJson(Map<String, dynamic> json,
      {DocumentReference<Map<String, dynamic>>? reference}) {
    return UniversityCard(
      documentReference: reference,
      id: json["id"],
      department: json["department"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "department": department,
      "name": name,
    };
  }
}
