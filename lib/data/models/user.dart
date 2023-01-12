import 'package:flutter/cupertino.dart';
import 'package:tu_smart_session/data/models/student_subject.dart';

import 'gym_card.dart';
import 'health_card.dart';
import 'university_card.dart';

class User {
  int id;
  int studentNumber;
  String email;
  String phone;
  String password;
  UniversityCard? universityCard;
  HealthCard? healthCard;
  GymCard? gymCard;
  List<StudentSubject>? studentSubjects;
  User(
      {required this.id,
      required this.studentNumber,
      required this.email,
      required this.phone,
      required this.password,
      this.universityCard,
      this.healthCard,
      this.studentSubjects,
      this.gymCard});

  factory User.fromJson(Map<String, dynamic> json) {
    debugPrint(
        "================User->fromJson->subjects: ${List.from(json["subjects"] ?? []).toString()}================");
    return User(
      id: json["id"],
      studentNumber: json["student-number"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      universityCard: UniversityCard.fromJson(json["university-card"]),
      healthCard: HealthCard.fromJson(json["health-card"]),
      gymCard: GymCard.fromJson(json["gym-card"]),
      studentSubjects: (json["student-subject"] as List?)
          ?.map((e) => StudentSubject.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "student-number": studentNumber,
      "email": email,
      "phone": phone,
      "password": password,
      "university-card": universityCard?.toJson(),
      "health-card": healthCard?.toJson(),
      "gym-card": gymCard?.toJson(),
      "student-subject": studentSubjects?.map((e) => e.toJson()).toList(),
    };
  }

  Map<String, dynamic> toFirebase() {
    return {
      "id": id,
      "student-number": studentNumber,
      "email": email,
      "phone": phone,
      "password": password,
      if(universityCard?.documentReference!=null)
      "university-card": universityCard?.documentReference,
      if(healthCard?.documentReference!=null)
      "health-card": healthCard?.documentReference,
      if(gymCard?.documentReference!=null)
      "gym-card": gymCard?.documentReference,
      "student-subject": studentSubjects?.map((e) => e.toJson()).toList(),
    };
  }
}
