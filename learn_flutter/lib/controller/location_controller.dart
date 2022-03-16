import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/data/model/response/place_auto_completeModel.dart';
import 'package:learn_flutter/data/repository/location_repo.dart';
import 'package:learn_flutter/data/model/response/place_details_model.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  GoogleMapController? _googleMapController;
  Position? _currentLocation;
  final Set<Marker> _markers = {};
  BitmapDescriptor? _mapMarker;
  String _address = '';
  CameraPosition? _initialCameraPosition;
  Predictions? _prediction;
  Predictions get predictions => _prediction!;
  List<Predictions> _predictionList =[];
  List<Predictions> get predictionList => _predictionList;

  GoogleMapController get googleMapController => _googleMapController!;
  Set<Marker> get marker => _markers;
  String? get address => _address;
  Position? get currentLocation => _currentLocation;
  CameraPosition get initialCameraPosition => _initialCameraPosition!;

  void mapCreator(GoogleMapController getController) {
    _googleMapController = getController;
    update();
  }

  void initCameraPosition() {
    _initialCameraPosition = const CameraPosition(target: LatLng(23.777176, 90.399452), zoom: 11.5);
  }

  Future<void> setCustomMarker() async {
    _mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 3.5, size: Size(15, 15)),"assets/images/gmap-marker.png");
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

    _currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var newPosition = CameraPosition(target: LatLng(_currentLocation!.latitude, _currentLocation!.longitude),zoom: 16);

    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);

    _googleMapController!.animateCamera(cameraUpdate);

    _markers.add(Marker(
          markerId: const MarkerId('id-1'),
          draggable: true,
          position: LatLng(_currentLocation!.latitude, _currentLocation!.longitude),
          infoWindow: const InfoWindow(title: "My Location"),
          icon: _mapMarker!));

    update();
  }

  void updatePosition(CameraPosition position) async {
    getCurrentAddress(latitude: position.target.latitude, longitude: position.target.longitude);
    update();
  }

  Future<void> getCurrentAddress({required double latitude, required double longitude, }) async {
    List<Placemark> placers = await placemarkFromCoordinates(latitude, longitude);

      _address = '${placers[0].name}/${placers[0].thoroughfare}-${placers[0]
          .subLocality}, ${placers[0].country}';

    update();
  }
  Future<List<Predictions>> searchLocation(BuildContext context, String? searchText) async {
    if(searchText != null && searchText.isNotEmpty){

      Response response = await locationRepo.searchLocation(searchText);
      if(response.statusCode == 200){
        _predictionList.addAll(PlaceAutoCompleteModel.fromJson(response.body).predictionList);
      }
    }
    return _predictionList;

  }
  void setLocation(String placeId, String address, GoogleMapController? gMapController) async{

    LatLng latLng = const LatLng(0,0);

    Response response = await locationRepo.placeDetailsByPlaceId(placeId);
    PlaceDetailsModel _placeDetails = PlaceDetailsModel();

    if(response.statusCode == 200){
      _placeDetails = PlaceDetailsModel.fromJson(response.body);
      if(_placeDetails.status == 'OK'){
        latLng =LatLng(_placeDetails.result!.geometry!.location!.lat!, _placeDetails.result!.geometry!.location!.lng!);
    }
    }
    _address = address;
    if(gMapController != null) {
      gMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng,zoom:16)));

    }
    update();

  }





}
