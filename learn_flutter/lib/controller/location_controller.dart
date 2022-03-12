import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  GoogleMapController? _googleMapController;
  Position? currentLocation;
  Set<Marker> _markers = {};
  BitmapDescriptor? _mapMarker;
  String _address = '';
  CameraPosition? _initialCameraPosition;

  GoogleMapController get googleMapController => _googleMapController!;
  Set<Marker> get marker => _markers;
  String get adderss => _address;
  CameraPosition get initialCameraPosition => _initialCameraPosition!;

  void mapCreator(GoogleMapController getController) {
    _googleMapController = getController;
    update();
  }

  void initCameraPosition() {
    _initialCameraPosition = const CameraPosition(target: LatLng(23.777176, 90.399452), zoom: 11.5);
  }

  Future<void> setCustomMarker() async {
    _mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 3.5, size: Size(15, 15)),"assets/image/gmap-marker.png");
    update();
  }

  Future<void> getCurrentLocation({GoogleMapController? googleMapController}) async {
    _googleMapController = googleMapController;
    LocationPermission permission;
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location service are disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are disabled");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied, we cannot request permissions");
    }

    currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var newPosition = CameraPosition(target: LatLng(currentLocation!.latitude, currentLocation!.longitude),zoom: 16);

    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);

    _googleMapController!.animateCamera(cameraUpdate);

    _markers.add(Marker(
          markerId: MarkerId('id-1'),
          draggable: true,
          position: LatLng(currentLocation!.latitude, currentLocation!.longitude),
          infoWindow: InfoWindow(title: "My Location"),
          icon: _mapMarker!));

    update();
  }

  void updatePosition(CameraPosition position) async {
    getCurrentAddress(latitude: position.target.latitude, longitude: position.target.longitude);
    update();
  }

  void getCurrentAddress({required double latitude, required double longitude, }) async {
    List<Placemark> placers = await placemarkFromCoordinates(latitude, longitude);
    _address = '${placers[0].name}/${placers[0].thoroughfare}-${placers[0].subLocality}, ${placers[0].country}';
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    setCustomMarker();
    super.onInit();
  }

}
