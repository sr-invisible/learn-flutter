import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/helper/route_helper.dart';
import 'package:learn_flutter/util/images.dart';
import 'package:learn_flutter/view/screen/location/search_dialog.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _googleMapController;
  CameraPosition? _cameraPosition;

  final CameraPosition _initialCameraPosition = const CameraPosition(target: LatLng(23.777176, 90.399452), zoom: 16);

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController nameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<LocationController>(builder: (locationController) {
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

                // Positioned(top: 20, left: 40,
                //   child: Container( height: 40, alignment: Alignment.center,color: Colors.grey.shade500,padding: const EdgeInsets.all(10),
                //         child: Row(children: [
                //           Image.asset(Images.marker, width: 30,height: 30),
                //             Text(locationController.address,style: const TextStyle(color: Colors.white)),
                //           ],
                //         )),
                // ),
            Positioned(top: 25, left: 5, right: 5, child: InkWell(
                onTap: () => Get.dialog(
                  LocationSearchDialog(mapController: _googleMapController,)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(height: 50, padding: const EdgeInsets.symmetric( horizontal: 10),
                    decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius:BorderRadius.circular(5), boxShadow: [
                      BoxShadow(color: Colors.blue.withOpacity(.5),offset: const Offset(0,1),blurRadius: 5)
                    ]),

                    child: Row(children: [
                      Icon(Icons.location_on,size: 25, color: Theme.of(context).primaryColor),
                      const SizedBox(width:5),

                      Expanded(child: Text(locationController.address! ,maxLines: 1,overflow: TextOverflow.ellipsis)),
                      const SizedBox(width: 5),

                      Icon(Icons.search,size: 25,color: Theme.of(context).primaryColor),
                    ]),
                  ),
                ),
              ),
            ),


            Center(child: Image.asset(Images.marker, height: 55,width: 30)),

            Positioned(left: 100,bottom: 30,
              child: ElevatedButton(onPressed: () {
                Get.offNamed(RouteHelper.getHomeRoute(locationController.address!));
                // if(locationController.currentLocation != null){
                //   locationController.getCurrentAddress(latitude: _cameraPosition!.target.latitude, longitude: _cameraPosition!.target.longitude);
                // }else {
                //   locationController.getCurrentAddress(latitude: _initialCameraPosition.target.latitude, longitude: _initialCameraPosition.target.longitude);
                // }

                  },
                  child:  Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('pick_location'.tr)))),
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
