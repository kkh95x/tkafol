// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';

class MapsDialog {
  static Future<void> showLoadingDialog(
      {required BuildContext context,
      required LatLng target,
      required void Function(LatLng)? onTap}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          CameraPosition initialCameraPosition =
              CameraPosition(target: target, zoom: 14);
          return WillPopScope(
              onWillPop: () async => true,
              child: SimpleDialog(
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                        child: SizedBox(
                            height: 300,
                            width: 300,
                            child: _MapDialoge(
                              initialCameraPosition: initialCameraPosition,
                              onTap: onTap,
                            )))
                  ]));
        });
  }

  static Future<void> showMarkerInMap({
    required BuildContext context,
    required LatLng target,
  }) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => true,
              child: SimpleDialog(
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                        child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Stack(
                              children: [
                                MapShowSingleMark(
                                  argument: target,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close,
                                        size: 40, color: Colors.white))
                              ],
                            )))
                  ]));
        });
  }
}

class _MapDialoge extends StatefulWidget {
  _MapDialoge(
      {super.key, required this.initialCameraPosition, required this.onTap});
  CameraPosition initialCameraPosition;
  void Function(LatLng)? onTap;
  @override
  State<_MapDialoge> createState() => _MapDialogeState();
}

class _MapDialogeState extends State<_MapDialoge> {
  Set<Marker> _marker = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: widget.initialCameraPosition,
          markers: _marker,
          onTap: (argument) {
            widget.onTap!(argument);
            _marker = {
              Marker(
                  markerId: const MarkerId("karim"),
                  position: argument,
                  icon: BitmapDescriptor.defaultMarker)
            };
            setState(() {});
          },
        ),
        Visibility(
          visible: _marker.isNotEmpty,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              name: "حفظ",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}

class MapShowSingleMark extends StatelessWidget {
  MapShowSingleMark({super.key, required this.argument});
  LatLng argument;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(target: argument, zoom: 17.0),
      markers: {
        Marker(
            markerId: const MarkerId("fj"),
            position: argument,
            icon: BitmapDescriptor.defaultMarker)
      },
      onTap: (argument) {},
    );
  }
}
