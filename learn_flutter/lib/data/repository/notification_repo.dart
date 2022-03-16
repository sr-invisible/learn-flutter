import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class NotificationRepo {

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