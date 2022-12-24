import 'package:cloud_firestore/cloud_firestore.dart';

class GymCard {
  int id;
  String name;
  DateTime? expire;
  DateTime? joining;
  DocumentReference<Map<String, dynamic>>? documentReference;
  GymCard(
      {required this.id,
      required this.name,
      this.expire,
      this.joining,
      this.documentReference});

  factory GymCard.fromJson(Map<String, dynamic> json,
      {DocumentReference<Map<String, dynamic>>? reference}) {
    return GymCard(
        documentReference: reference,
        id: json["id"],
        name: json["name"],
        expire: DateTime.tryParse(json["expire"] ?? ""),
        joining: DateTime.tryParse(json["joining"] ?? ""));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "expire": expire?.toIso8601String(),
      "joining": joining?.toIso8601String(),
    };
  }
}
