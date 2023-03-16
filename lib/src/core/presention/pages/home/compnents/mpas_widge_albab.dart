// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/bottom_menu_widget.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';

class MapAllDerbrisAlbab extends StatefulWidget {
  const MapAllDerbrisAlbab({Key? key}) : super(key: key);

  @override
  State<MapAllDerbrisAlbab> createState() => _MapAllDerbrisAlbabState();
}

class _MapAllDerbrisAlbabState extends State<MapAllDerbrisAlbab> {
  // Location MylocationDerbris = Location();
  late GoogleMapController gmc;
  Set<Marker> marker = {};
  bool isLoading = true;

  /// get Data For Markers

  Future<Set<Marker>> getData() async {
    var responsd = await supabaseCleint
        .from("users")
        .select()
        .eq("typeUser", TypeUser.needy.getStringNameTypeUser())
        .eq("cityName", "الباب")
        .execute();

    if (responsd.error != null) {
      // getSnackBar(context, "   لايتوفر اتصال بالانترنت");
      throw Exception("لا يوجد أنترنت");
    }

    List dataList = responsd.data ?? "" as List;

    if (dataList.isNotEmpty) {
      for (int i = 0; i < dataList.length; i++) {
        double latitude = dataList[i]['latitude'];
        double longitude = dataList[i]['longitude'];

        ///Marker In Map
        marker.add(Marker(
            markerId: MarkerId("${dataList[i]['id']}"),
            position: LatLng(latitude, longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(8),
            onTap: () {
              SlideDialog.showSlideDialog(
                  context: context,
                  barrierDismissible: true,
                  transitionDuration: const Duration(milliseconds: 500),
                  child: BottomPersonMenu(
                    latLng: LatLng(latitude, longitude) ,
                    id: dataList[i]['id'],
                    email: dataList[i]['email'],
                    cityName: dataList[i]['cityName'] ?? "",
                    onTapSendMassageButtom: () {},
                  ));
              // showMaterialModalBottomSheet(
              //   elevation: 3,
              //   context: context,
              //   builder: (context) {
              //     return BottomPersonMenu(
              //       id: dataList[i]['id'],
              //       cityName: "Syria,Aleepo,Azzaz",
              //       onTapSendMassageButtom: () {
              //         //TODO impelemnt to creat new chat with mark user id
              //       },
              //     );
              //   },
              // );
              // showBottomSheet(
              //   context: context,
              //   enableDrag: true,
              //   elevation: 9,
              //   builder: (context) {
              //     return BottomPersonMenu(
              //       id: dataList[i]['id'],
              //       cityName: "Syria,Aleepo,Azzaz",
              //       onTapSendMassageButtom: () {
              //         //TODO impelemnt to creat new chat with mark user id
              //       },
              //     );
              //   },
              // );
            },
            infoWindow: InfoWindow(title: dataList[i]["id"], onTap: () {})));
        return marker;
      }
    } else {
      throw Exception("قائمة المحتاجين فارغة");
    }
    throw Exception("حدث خطأ ما");
  }

  //////////////////////////

  /// camera on open the Map
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(36.370748, 37.514411), // albab
    zoom: 13.4746,
  );

  bool isSendData = false;
  helped(int id) async {
    isSendData = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  MapType _mapType = MapType.hybrid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) => Stack(
        children: [
          GoogleMap(
            onTap: (latlng) {
              /// add Marker in Map
              // addMarkerInMap(latlng);
            },
            markers: marker,
            mapType: _mapType,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              //  _controller.complete(controller);
              gmc = controller;
            },
          ),
          if (snapshot.hasError)
            Align(
              alignment: Alignment.center,
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(color: Colors.black45),
                  child: Text(
                    snapshot.error.toString().split(":")[1],
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
            ),
          if (!snapshot.hasData && snapshot.data == null && !snapshot.hasError)
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor.withOpacity(0.9),
                  onPressed: () {
                    if (_mapType == MapType.hybrid) {
                      _mapType = MapType.normal;
                    } else {
                      _mapType = MapType.hybrid;
                    }
                    setState(() {});
                  },
                  child: (_mapType == MapType.hybrid)
                      ? const Icon(
                          Icons.satellite_alt,
                        )
                      : const Icon(Icons.map),
                ),
              ))
        ],
      ),
    );
  }
}
