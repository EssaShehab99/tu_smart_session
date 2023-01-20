import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tu_smart_session/data/models/place.dart';
import 'package:tu_smart_session/data/repositories/place_repository.dart';
import '/data/network/data_response.dart';
import '/data/di/service_locator.dart';

class PlaceProvider extends ChangeNotifier {
  final _placeRepository = getIt.get<PlaceRepository>();
  List<Place> places=[];
  List<LatLng> polygons = const [
    LatLng(21.4280225, 40.4729483),
    LatLng(21.4278426, 40.4753838),
    LatLng(21.4274829, 40.4753087),
    LatLng(21.4258340, 40.4762957),
    LatLng(21.4258951, 40.4769620),
    LatLng(21.4261924, 40.4773750),
    LatLng(21.4290194, 40.4774303),
    LatLng(21.4294836, 40.4774319),
    LatLng(21.4299458, 40.4777806),
    LatLng(21.4298074, 40.4784313),
    LatLng(21.4313227, 40.4783320),
    LatLng(21.4313818, 40.4783446),
    LatLng(21.4314012, 40.4783614),
    LatLng(21.4314280, 40.4783721),
    LatLng(21.4314468, 40.4783755),
    LatLng(21.4314599, 40.4783802),
    LatLng(21.4314811, 40.4783856),
    LatLng(21.4314967, 40.4783869),
    LatLng(21.4315130, 40.4783869),
    LatLng(21.4315305, 40.4783936),
    LatLng(21.4315861, 40.4783970),
    LatLng(21.4316436, 40.4783996),
    LatLng(21.4316861, 40.4783970),
    LatLng(21.4317136, 40.4783970),
    LatLng(21.4317535, 40.4783755),
    LatLng(21.4317860, 40.4783594),
    LatLng(21.4318285, 40.4783379),
    LatLng(21.4318909, 40.4783004),
    LatLng(21.4319284, 40.4782763),
    LatLng(21.4330895, 40.4781920),
    LatLng(21.4329846, 40.4768322),
    LatLng(21.4327130, 40.4737390),
    LatLng(21.4280232, 40.4729118),
  ];
  Future<Result> getPlaces() async {
    debugPrint("==========PlaceProvider->getPlaces->|| ==========");
    Result result = await _placeRepository.getPlaces();
    if (result is Success) {
      places = result.value;
    }
    return result;
  }

  Future<List<LatLng>> getRouteBetweenCoordinates(LatLng start, LatLng end) async{
    Result result = await _placeRepository.getRouteBetweenCoordinates(start, end);
    if (result is Success) {
      return result.value;
    }
    return [];
  }
}
