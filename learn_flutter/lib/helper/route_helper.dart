
import 'package:get/get.dart';
import 'package:learn_flutter/view/screen/location/google_map_screen.dart';
import 'package:learn_flutter/view/screen/home/home_screen.dart';
import 'package:learn_flutter/view/screen/notification/notification_screen.dart';
import 'package:learn_flutter/view/screen/university/university_screen.dart';

class RouteHelper {
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String gMap = '/google-map';
  static const String university = '/university';

  static String  getInitialRoute() => initialRoute;
  static String  getHomeRoute(String address) => '$home?address=$address';
  static String  getNotificationRoute() => notification;
  static String  getGoogleMapRoute() => gMap;
  static String  getUniversityRoute() => university;

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const GoogleMapScreen()),
    GetPage(name: home, page: () => HomeScreen(address: Get.parameters['address'])),
    GetPage(name: notification, page: () => const NotificationScreen()),
    GetPage(name: university, page: () => const UniversityScreen())

   
  ];
}