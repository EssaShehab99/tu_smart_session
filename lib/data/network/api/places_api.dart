import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'constants/endpoint.dart';

class PlaceApi {

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getPlaces() async {
    try {
      final response=  await _fireStore
          .collection(Endpoints.places)
          .get();
      return response.docs;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getRouteBetweenCoordinates(double startLatitude,double startLongitude,double endLatitude,double endLongitude) async {
    /*  List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    addPolyLine(polylineCoordinates);*/
    /*List<LatLng> coordinates=[];
    Response response = await get(Uri.parse(
        "https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62484fb27a9a6569436a8321a6780a2549a4&start=${startLatitude},${startLongitude}&end=${endLatitude},${endLongitude}"));

    var data = (jsonDecode(response.body)["features"] as List?)
        ?.get(0)["geometry"]["coordinates"];
    coordinates=List.of(data).map((e) => LatLng(List.of(e).get(0), List.of(e).get(1))).toList();
    return coordinates;*/

    Response response = await get(Uri.parse(
        "http://www.mapquestapi.com/directions/v2/route?key=Ex7UsYmSc7OBavM7L2asxSxVfM2NX2A0&from=$startLatitude,$startLongitude&to=$endLatitude,$endLongitude"));
    return response;
  }
}
