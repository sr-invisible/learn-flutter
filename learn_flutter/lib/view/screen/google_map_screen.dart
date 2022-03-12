import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/helper/route_helper.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen();

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _googleMapController;
  Position? currentLocation;
  CameraPosition? _cameraPosition;

  final CameraPosition _initialCameraPosition = CameraPosition(target: const LatLng(23.777176, 90.399452), zoom: 11.5);

  @override
  void initState() {
    super.initState();
    // Get.find<LocationController>().getCurrentAddress();
  }

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<LocationController>(builder: (controller) {
        return Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              mapToolbarEnabled: true,
              onMapCreated: (GoogleMapController mapController) {
                _googleMapController = mapController;
              },
              onCameraMove: (CameraPosition cameraPosition) {
                _cameraPosition = cameraPosition;
              },
              onCameraIdle: () {Get.find<LocationController>().updatePosition(_cameraPosition!);} ,
              // markers: controller.marker,
            ),

                Positioned(top: 20, left: 40,
                  child: controller.adderss != null ? Container( height: 40, alignment: Alignment.center,color: Colors.grey.shade500,padding: EdgeInsets.all(10),
                        child: Text('${controller.adderss} ',style: const TextStyle(color: Colors.white))) : Container(),
                ),

            Center(child: Image.asset('assets/image/gmap-marker.png', height: 55,width: 30)),

            Positioned(left: 100,bottom: 30,
              child: ElevatedButton(onPressed: () {
                    Get.offNamed(RouteHelper.getHomeRoute(Get.find<LocationController>().adderss));
                    Get.find<LocationController>().getCurrentLocation(googleMapController: _googleMapController);
                  },
                  child: const Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Pick Location')))),
          ],
        );
      }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Get.find<LocationController>().getCurrentLocation(googleMapController: _googleMapController),
        child: const Icon(Icons.my_location),
      ),
    ));
  }
}
