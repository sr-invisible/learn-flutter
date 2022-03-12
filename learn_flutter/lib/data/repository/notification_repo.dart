import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:learn_flutter/data/model/notification_model.dart';

class NotificationRepo{

  Future<void> getMessage(RemoteMessage message) async {
    print('background message ${message.notification!.body}');
  }

    // FirebaseMessaging.onMessage.listen((message) {
    //   if(message.notification != null) {
    //     print(message.notification!.body);
    //     print(message.notification!.title);
    //   }
    // });



}