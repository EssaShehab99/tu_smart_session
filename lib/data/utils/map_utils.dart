import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  MapUtils._privateConstructor();
  static final MapUtils _instance = MapUtils._privateConstructor();
  static MapUtils get instance => _instance;

  static bool containsLocationAtLatLng(
      LatLng point, List<LatLng> polygon, bool geodesic) {
    if (polygon.isEmpty) {
      return false;
    }

    final lat3 = _toRadians(point.latitude);
    final lng3 = _toRadians(point.longitude);
    final prev = polygon.last;
    var lat1 = _toRadians(prev.latitude);
    var lng1 = _toRadians(prev.longitude);
    var nIntersect = 0;

    for (final point2 in polygon) {
      final dLng3 = _wrap(lng3 - lng1, -pi, pi);
      // Special case: point equal to vertex is inside.
      if (lat3 == lat1 && dLng3 == 0) {
        return true;
      }
      final lat2 = _toRadians(point2.latitude);
      final lng2 = _toRadians(point2.longitude);
      // Offset longitudes by -lng1.
      if (_intersects(
          lat1, lat2, _wrap(lng2 - lng1, -pi, pi), lat3, dLng3, geodesic)) {
        ++nIntersect;
      }
      lat1 = lat2;
      lng1 = lng2;
    }
    return (nIntersect & 1) != 0;
  }

  static bool _intersects(
      num lat1, num lat2, num lng2, num lat3, num lng3, bool geodesic) {
    // Both ends on the same side of lng3.
    if ((lng3 >= 0 && lng3 >= lng2) || (lng3 < 0 && lng3 < lng2)) {
      return false;
    }
    // Point is South Pole.
    if (lat3 <= -pi / 2) {
      return false;
    }
    // Any segment end is a pole.
    if (lat1 <= -pi / 2 ||
        lat2 <= -pi / 2 ||
        lat1 >= pi / 2 ||
        lat2 >= pi / 2) {
      return false;
    }
    if (lng2 <= -pi) {
      return false;
    }

    final linearLat = (lat1 * (lng2 - lng3) + lat2 * lng3) / lng2;
    // Northern hemisphere and point under lat-lng line.
    if (lat1 >= 0 && lat2 >= 0 && lat3 < linearLat) {
      return false;
    }
    // Southern hemisphere and point above lat-lng line.
    if (lat1 <= 0 && lat2 <= 0 && lat3 >= linearLat) {
      return true;
    }
    // North Pole.
    if (lat3 >= pi / 2) {
      return true;
    }

    // Compare lat3 with latitude on the GC/Rhumb segment corresponding to lng3.
    // Compare through a strictly-increasing function (tan() or
    // _mercator()) as convenient.
    return geodesic
        ? tan(lat3) >= _tanLatGC(lat1, lat2, lng2, lng3)
        : _mercator(lat3) >= _mercatorLatRhumb(lat1, lat2, lng2, lng3);
  }

  static num _tanLatGC(num lat1, num lat2, num lng2, num lng3) =>
      (tan(lat1) * sin(lng2 - lng3) + tan(lat2) * sin(lng3)) / sin(lng2);
  static num _mercatorLatRhumb(num lat1, num lat2, num lng2, num lng3) =>
      (_mercator(lat1) * (lng2 - lng3) + _mercator(lat2) * lng3) / lng2;

  static num _toRadians(num degrees) => degrees / 180.0 * pi;

  static num _wrap(num n, num min, num max) =>
      (n >= min && n < max) ? n : (_mod(n - min, max - min) + min);
  static num _mod(num x, num m) => ((x % m) + m) % m;

  static num _mercator(num lat) => log(tan(lat * 0.5 + pi / 4));
}
