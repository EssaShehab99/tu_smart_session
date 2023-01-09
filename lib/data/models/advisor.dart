class Advisor {
  int id;
  String? name;
  String? userName;

  Advisor({required this.id, this.name, this.userName});

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(
      id: json["id"],
      name: json["name"],
      userName: json["user-name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "user-name": userName,
    };
  }


}
