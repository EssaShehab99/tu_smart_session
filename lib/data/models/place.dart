import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tu_smart_session/data/utils/enum.dart';

class Place {
  int id;
  String name;
  PlaceType placeType;
  LatLng? latLng;

  Place(
      {required this.id,
      required this.name,
      required this.placeType,
      this.latLng});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json["id"],
      name: json["name"],
      placeType:
          json["type"] == "building" ? PlaceType.building : PlaceType.service,
      latLng: LatLng(json["latitude"], json["longitude"]),
    );
  }
}
