import 'package:cloud_firestore/cloud_firestore.dart';

class HealthCard {
  int id;
  String name;
  String? bloodType;
  DateTime? dateOfBirth;
  String? chronicDisease;
  String? medication;
  String? emergencyContact1;
  String? emergencyContact2;
  DocumentReference<Map<String, dynamic>>? documentReference;

  HealthCard(
      {required this.id,
      required this.name,
      this.bloodType,
      this.dateOfBirth,
      this.chronicDisease,
      this.medication,
      this.emergencyContact1,
      this.emergencyContact2,
      this.documentReference});

  factory HealthCard.fromJson(Map<String, dynamic> json,
      {DocumentReference<Map<String, dynamic>>? reference}) {
    return HealthCard(
      documentReference: reference,
      id: json["id"],
      name: json["name"],
      bloodType: json["blood-type"],
      dateOfBirth: DateTime.tryParse(json["date-of-birth"] ?? ""),
      chronicDisease: json["chronic-disease"],
      medication: json["medication"],
      emergencyContact1: json["emergency-contact1"],
      emergencyContact2: json["emergency-contact2"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "blood-type": bloodType,
      "date-of-birth": dateOfBirth?.toIso8601String(),
      "chronic-disease": chronicDisease,
      "medication": medication,
      "emergency-contact-1": emergencyContact1,
      "emergency-contact-2": emergencyContact2,
    };
  }
//

}
