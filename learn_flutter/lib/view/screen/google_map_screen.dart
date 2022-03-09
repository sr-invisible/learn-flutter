
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen();
  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
GoogleMapController? _googleMapController;
Position? currentLocation;
Set<Marker> _markers = {};
 BitmapDescriptor? mapMarker;

  CameraPosition _initialCameraPosition = CameraPosition(target: LatLng(23.777176,90.399452),zoom: 11.5);
  Future<void> setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/image/gmap-marker.png");
  }
   _getLocation()  async {
     bool serviceEnabled;
     LocationPermission permission;
     serviceEnabled = await Geolocator.isLocationServiceEnabled();
     if(!serviceEnabled){
       return Future.error("Location service are disabled");
     }
     permission = await Geolocator.checkPermission();
     if(permission == LocationPermission.denied){
       permission = await Geolocator.requestPermission();
       if(permission == LocationPermission.denied){
         return Future.error("Location permissions are disabled");
       }
     }
     if(permission == LocationPermission.deniedForever){
       return Future.error("Location permissions are permanently denied, we cannot request permissions");
     }
     currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     var newPosition = CameraPosition(target: LatLng(currentLocation!.latitude , currentLocation!.longitude),zoom: 16);
     CameraUpdate update = CameraUpdate.newCameraPosition(newPosition);
     _googleMapController!.animateCamera(update);
     _markers.add(Marker(markerId: MarkerId('id-1'),position: LatLng(currentLocation!.latitude , currentLocation!.longitude), infoWindow: InfoWindow(title: "My Location")));
   }

   void _onMapCreated(GoogleMapController googleMapController) {
    setState(() {
      _googleMapController = googleMapController;
      _markers.add(Marker(markerId: MarkerId('id-1'),position: LatLng(currentLocation!.latitude , currentLocation!.longitude), infoWindow: InfoWindow(title: "My Location")));
      _markers.add(const Marker(markerId: MarkerId('id-2'),position:  LatLng(23.777176,90.399452), infoWindow: InfoWindow(title: "Title")));
    });
   }

   @override
  void dispose() {
     _googleMapController!.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      mapToolbarEnabled: true,
      onMapCreated: _onMapCreated,
      markers: _markers,

    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _getLocation(),
        child: Icon(Icons.my_location),
      ),
    ));
  }
}
