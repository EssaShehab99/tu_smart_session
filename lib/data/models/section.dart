class Section {
  int id;
  int room;
  String day;
  DateTime time;

  Section({required this.id, required this.room, required this.day, required this.time});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json["id"],
      room: json["room"],
      day: json["day"],
      time: DateTime.parse(json["time"]),
    );
  }
//

}
