import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tu_smart_session/data/models/place.dart';
import 'package:tu_smart_session/data/network/api/places_api.dart';
import 'package:tu_smart_session/data/utils/extension.dart';
import '/data/network/data_response.dart';

class PlaceRepository {
  final PlaceApi _placeApi;
  PlaceRepository(this._placeApi);

  Future<Result> getPlaces() async {
    debugPrint("==========PlaceRepository->getPlaces->|| ==========");
    try {
      final response = await _placeApi.getPlaces();
      return Success(response.map((e) => Place.fromJson(e.data())).toList());
    } catch (e) {
      return Error(e);
    }
  }
  Future<Result> getRouteBetweenCoordinates(LatLng start, LatLng end) async {
    debugPrint("==========PlaceRepository->getRouteBetweenCoordinates->|| ==========");
    try {

      final response = await _placeApi.getRouteBetweenCoordinates(start.latitude, start.longitude, end.latitude, end.longitude);

    List<LatLng> coordinates = List.of(List.of(jsonDecode(response.body)["route"]["legs"]).get(0)["maneuvers"])
          .map((e) => LatLng(e["startPoint"]["lat"], e["startPoint"]["lng"]))
          .toList();
    return Success(coordinates);
    } catch (e) {
      return Error(e);
    }
  }
}
