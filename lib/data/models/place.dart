import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  int id;
  String name;
  String? service;
  LatLng? latLng;

  Place({required this.id, required this.name, this.service, this.latLng});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json["id"],
      name: json["name"],
      service: json["service"],
      latLng: LatLng(json["latitude"], json["longitude"]),
    );
  }


}
