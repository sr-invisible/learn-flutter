import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn_flutter/helper/route_helper.dart';
import 'package:learn_flutter/services/local_notification_service.dart';
import 'package:learn_flutter/view/screen/google_map_screen.dart';
import 'package:learn_flutter/view/screen/green_screen.dart';
import 'package:learn_flutter/view/screen/home_screen.dart';

import 'helper/get_di.dart';

//receive message when app is in background
Future<void> backgroundHandler(RemoteMessage m) async {
  print(m.data.toString());
  print(m.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialise();
 await Firebase.initializeApp();

 init();

 FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,
    );
  }
}
