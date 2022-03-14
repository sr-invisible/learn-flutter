import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationRepo{

  Future<void> getMessage(RemoteMessage message) async {
    if (kDebugMode) {
      print('background message ${message.notification!.body}');
    }
  }

    // FirebaseMessaging.onMessage.listen((message) {
    //   if(message.notification != null) {
    //     print(message.notification!.body);
    //     print(message.notification!.title);
    //   }
    // });



}