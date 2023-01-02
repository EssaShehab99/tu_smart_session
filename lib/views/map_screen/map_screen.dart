import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/dropdown_field_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/shared/text_field_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.onTapMap}) : super(key: key);
  final ArgumentCallback<LatLng>? onTapMap;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  late Completer<GoogleMapController> _controller;

  late CameraPosition initialCameraPosition;
  _handleTap(LatLng point) {
    // setState(() {
    //   markers.add(Marker(
    //     markerId: const MarkerId("1"),
    //     position: point,
    //     infoWindow: const InfoWindow(
    //       title: 'hospital-location',
    //     ),
    //   ));
    //   widget.onTapMap!(point);
    // });
  }

  @override
  void initState() {
    _controller = Completer();
    initialCameraPosition = const CameraPosition(
      target: LatLng(21.43124601185503, 40.476451419048345),
      zoom: 15,
    );
    _handleTap(const LatLng(21.43124601185503, 40.476451419048345));
    super.initState();
  }

  Set<Polygon> myPolygon() {
    Set<Polygon> polygonSet = {};
    polygonSet.add(Polygon(
      fillColor: Colors.black.withOpacity(0.5),
      polygonId: const PolygonId('test'),
      strokeWidth: 1,
      strokeColor: Colors.red,
      holes: const [
        [
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
        ]
      ],
      points: const [
        LatLng(-89, 0),
        LatLng(89, 0),
        LatLng(89, 179.999),
        LatLng(-89, 179.999),
      ],
    ));
    return polygonSet;
  }

  @override
  Widget build(BuildContext context) {
    int searchType = -1;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.of(markers),
            polygons: myPolygon(),
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(Factory<ScaleGestureRecognizer>(
                  () => ScaleGestureRecognizer()))
              ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
              ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer())),
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: _handleTap,
          ),
          SharedComponents.appBar("Campus Map"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            SharedComponents.showBottomSheet(context,
                child: StatefulBuilder(builder: (context, setStateWidget) {
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(SharedValues.padding),
                children: [
                  DropdownFieldWidget(
                      hintText: "Search by",
                      prefixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: [
                        DropdownMenuItemModel(text: "Name or Number", id: 0),
                        DropdownMenuItemModel(text: "Search by Service", id: 1)
                      ],
                      onChanged: (value) {
                        setStateWidget(() {
                          searchType = value?.id ?? -1;
                        });
                      },
                      keyDropDown: GlobalKey()),
                  const SizedBox(height: SharedValues.padding),
                  if (searchType == 0)
                    TextFieldWidget(
                        controller: TextEditingController(),
                        hintText: "Building name"),
                  if (searchType == 1)
                    DropdownFieldWidget(
                        hintText: "Select Service",
                        prefixIcon:
                            const Icon(Icons.keyboard_arrow_down_rounded),
                        items: [
                          DropdownMenuItemModel(text: "11", id: 1),
                          DropdownMenuItemModel(text: "22", id: 2)
                        ],
                        onChanged: (value) {},
                        keyDropDown: GlobalKey()),
                  const SizedBox(height: SharedValues.padding * 4),
                  ButtonWidget(
                    child: Text("Search",
                        style: Theme.of(context).textTheme.button),
                  )
                ],
              );
            }));
          },
          child: const Icon(Icons.search_outlined)),
    ));
  }
}
