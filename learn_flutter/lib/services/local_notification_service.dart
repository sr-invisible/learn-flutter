import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learn_flutter/util/app_constants.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initialise(){

    const InitializationSettings initializationSettings = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings);
  }
  static void display(RemoteMessage message) async {
    try {
      // final id = DateTime.now().microsecondsSinceEpoch ~/100;
      const id = 32;
      const NotificationDetails notificationDetails = NotificationDetails(android: AndroidNotificationDetails(AppConstants.notificationChannelId,AppConstants.notificationChannelName,importance: Importance.max,priority: Priority.high));
       await _notificationsPlugin.show(id, message.notification!.title, message.notification!.title, notificationDetails);
    } on Exception catch (e) {
    if (kDebugMode) {
      print(e);
    }
    }

  }
}