import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/view/screen/google_map_screen.dart';
import 'package:learn_flutter/view/screen/home_screen.dart';
import 'package:learn_flutter/view/screen/notificaion/notification_screen.dart';

class RouteHelper {
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String gMap = '/google-map';
  
  static String  getInitialRoute() => '$initialRoute';
  static String  getHomeRoute(String address) => '$home?address=$address';
  static String  getnotificationRoute() => '$notification';
  static String  getGoogleMapRoute() => '$gMap';
  
  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => GoogleMapScreen()),
    GetPage(name: home, page: () => HomeScreen(address: Get.parameters['address'])),
    GetPage(name: notification, page: () => NotificationScreen()),
    
   
  ];
}