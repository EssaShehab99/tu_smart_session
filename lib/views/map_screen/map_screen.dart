import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:tu_smart_session/data/models/place.dart';
import 'package:tu_smart_session/data/providers/place_provider.dart';
import 'package:tu_smart_session/data/utils/enum.dart';
import 'package:tu_smart_session/data/utils/map_utils.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/dropdown_field_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';
import 'package:tu_smart_session/data/utils/extension.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  late Completer<GoogleMapController> _controller;
  late PlaceProvider provider;
  late CameraPosition initialCameraPosition;
  late TextEditingController placeController;
  SearchType searchType = SearchType.none;
  String? selectedService;
  LatLng? currentLocation;
  LatLng? endLocation;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  Location? location;
  StreamSubscription<LocationData>? locationSubscription;

  final StreamController<LatLng?> _streamController =
      StreamController.broadcast();
  List<LatLng> polygons = [];
  final List<DropdownMenuItemModel> searchByList = [
    DropdownMenuItemModel(text: "Name or Number", id: SearchType.numberOrName),
    DropdownMenuItemModel(text: "Search by Service", id: SearchType.service)
  ];
  @override
  void initState() {
    placeController = TextEditingController();
    provider = Provider.of<PlaceProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedComponents.showOverlayLoading(context, () async {
        await provider.getPlaces();
      });
    });
    polygons = provider.polygons;
    _controller = Completer();
    initialCameraPosition = const CameraPosition(
      target: LatLng(21.430399643909276, 40.47577334606505),
      zoom: 16.7,
    );
    super.initState();
  }

  _handleTap(LatLng point) {
    /*
    setState(() {
      debugPrint("========MapScreen->point: ${point.toString()}==========");
      markers.add(Marker(
        markerId: const MarkerId("1"),
        position: point,
        infoWindow: const InfoWindow(
          title: 'hospital-location',
        ),
      ));
    });
  */
  }
  Future<void> getDirections() async {
    List<LatLng> polylineCoordinates = [];
    if (currentLocation == null || endLocation == null) return;

    for (var point in await provider.getRouteBetweenCoordinates(
        currentLocation!, endLocation!)) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
    addPolyLine(polylineCoordinates);
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Theme.of(context).primaryColor,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  Set<Polygon> myPolygon() {
    Set<Polygon> polygonSet = {};
    polygonSet.add(Polygon(
      fillColor: Colors.black.withOpacity(0.5),
      polygonId: const PolygonId('test'),
      strokeWidth: 1,
      strokeColor: Colors.red,
      holes: [polygons],
      points: const [
        LatLng(-89, 0),
        LatLng(89, 0),
        LatLng(89, 179.999),
        LatLng(-89, 179.999),
      ],
    ));
    return polygonSet;
  }

  Future<void> getPermissions() async {
    location = Location.instance;
    location?.enableBackgroundMode(enable: false);
    bool? serviceEnabled;
    PermissionStatus? permissionGranted;

    serviceEnabled = await location?.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location?.requestService();
      if (!serviceEnabled!) {
        return;
      }
    }

    permissionGranted = await location?.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location?.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationSubscription = location?.onLocationChanged
        .listen((LocationData currentLocation) async {
          if(!mounted)return;
      debugPrint("====================================");
      if (MapUtils.containsLocationAtLatLng(LatLng(currentLocation.latitude!, currentLocation.longitude!),polygons,true)) {
        this.currentLocation =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        await getDirections();
        _streamController.sink.add(this.currentLocation);
      } else {
        locationSubscription?.cancel();
        SharedComponents.showSnackBar(context,
            "You must be on campus for the mapping services to be activated",
            backgroundColor: Theme.of(context).colorScheme.error);
      }
    });
  }

  Future<void> selectLocation(LatLng selectedLocation, String title) async {
    endLocation = selectedLocation;
    markers = [
      Marker(
        //add start location marker
        markerId: MarkerId(selectedLocation.toString()),
        position: selectedLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: title,
        ),
      )
    ];
    setState(() {});
    await getPermissions();
  }

  @override
  void dispose() {
    placeController.dispose();
    _streamController.close();
    locationSubscription?.cancel();
    location=null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop:   () async{
            locationSubscription?.cancel();
            return true;
          },
          child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: [
            StreamBuilder<LatLng?>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  return GoogleMap(
                    markers: Set<Marker>.of(markers),
                    polylines: Set<Polyline>.of(polylines.values), //polylines
                    polygons: myPolygon(),
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                          () => PanGestureRecognizer()))
                      ..add(Factory<ScaleGestureRecognizer>(
                          () => ScaleGestureRecognizer()))
                      ..add(Factory<TapGestureRecognizer>(
                          () => TapGestureRecognizer()))
                      ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onTap: _handleTap,
                  );
                }),
            SharedComponents.appBar("Campus Map"),
          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              SharedComponents.showBottomSheet(context,
                  height: MediaQuery.of(context).size.height,
                  child: StatefulBuilder(builder: (context, setStateWidget) {
                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(SharedValues.padding),
                  children: [
                    DropdownFieldWidget(
                        hintText: "Search by",
                        prefixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                        value: searchByList.firstWhereOrNull(
                            (element) => element.id == searchType),
                        items: searchByList,
                        onChanged: (value) {
                          setStateWidget(() {
                            searchType = value!.id;
                          });
                        },
                        keyDropDown: GlobalKey()),
                    const SizedBox(height: SharedValues.padding),
                    if (searchType == SearchType.numberOrName)
                      TextFieldWidget(
                          suggestions: provider.places.where((element) => element.placeType==PlaceType.building)
                              .map((e) => "${e.id} - ${e.name}")
                              .toList(),
                          controller: placeController,
                          hintText: "Building name"),
                    if (searchType == SearchType.service)
                      DropdownFieldWidget(
                          hintText: "Select Service",
                          prefixIcon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                          items: [
                            for (Place place
                                in provider.places.where((element) => element.placeType==PlaceType.service))
                              DropdownMenuItemModel(
                                  text: place.name, id: place.id),
                          ],
                          onChanged: (value) {
                            selectedService = value?.text;
                          },
                          keyDropDown: GlobalKey()),
                    const SizedBox(height: SharedValues.padding * 4),
                    ButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);

                        if (searchType == SearchType.numberOrName) {
                          Place? place = provider.places.firstWhereOrNull(
                              (element) =>  "${element.id} - ${element.name}"== placeController.text);
                          if (place?.latLng != null && place?.name != null) {
                            await selectLocation(place!.latLng!, place.name);
                          }
                        }
                        else if (searchType == SearchType.service) {
                          Place? place = provider.places.firstWhereOrNull(
                                  (element) =>  element.name== selectedService);
                          if (place?.latLng != null && place?.name != null) {
                            await selectLocation(place!.latLng!, place.name);
                          }
                          /*
                       setState(() {
                         markers.clear();
                         markers.addAll(provider.places
                             .where(
                                 (element) => element.service == selectedService)
                             .map((e) => Marker(
                           //add start location marker
                           markerId:
                           MarkerId(e.id.toString()),
                           position:
                           e.latLng!, //position of marker
                           infoWindow: InfoWindow(
                             //popup info
                             title: e.name,
                           ),
                           onTap: () async {
                             await selectLocation(e.latLng!, e.name);
                           },
                         ))
                             .toList());
                       });
                        */}
                      },
                      child: Text("Search",
                          style: Theme.of(context).textTheme.button),
                    )
                  ],
                );
              }));
            },
            child: const Icon(Icons.search_outlined)),
    ),
        ));
  }
}

enum SearchType { numberOrName, service, none }
