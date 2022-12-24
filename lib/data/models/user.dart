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
  User(
      {required this.id,
      required this.studentNumber,
      required this.email,
      required this.phone,
      required this.password,
      this.universityCard,
      this.healthCard,
      this.gymCard});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      studentNumber: json["student-number"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      universityCard: UniversityCard.fromJson(json["university-card"]),
      healthCard: HealthCard.fromJson(json["health-card"]),
      gymCard: GymCard.fromJson(json["gym-card"]),
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
    };
  }
  Map<String, dynamic> toFirebase() {
    return {
      "id": id,
      "student-number": studentNumber,
      "email": email,
      "phone": phone,
      "password": password,
      "university-card": universityCard?.documentReference,
      "health-card": healthCard?.documentReference,
      "gym-card": gymCard?.documentReference,
    };
  }
}
