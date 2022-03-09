import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initialise(){

    final InitializationSettings initializationSettings = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings);
  }
  static void display(RemoteMessage message) async {
    try {
      // final id = DateTime.now().microsecondsSinceEpoch ~/100;
      final id = 32;
      final NotificationDetails notificationDetails =NotificationDetails(android: AndroidNotificationDetails("learnflutter","learnflutter channel",importance: Importance.max,priority: Priority.high));
       await _notificationsPlugin.show(id, message.notification!.title, message.notification!.title, notificationDetails);
    } on Exception catch (e) {
    print(e);
    }

  }
}