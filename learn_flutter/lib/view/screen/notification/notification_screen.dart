
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/services/local_notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();

    // gives you the message on which user taps and if opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((m) {
      final routeFromMessage = m!.data["route"];
      Navigator.pushNamed(context, '/$routeFromMessage');
        debugPrint(m.notification!.body);
      debugPrint(m.notification!.title);

    });

    //foreground work
    FirebaseMessaging.onMessage.listen((m) {
      if(m.notification != null){
        debugPrint(m.notification!.body);
        debugPrint(m.notification!.title);
      }
      LocalNotificationService.display(m);
    });
    //when the app is in background but opened and user tap on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((m) {
      final routeFromMessage = m.data["route"];
      Navigator.pushNamed(context, '/$routeFromMessage');

    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('notification_alert'.tr),
            Text('message_title'.tr,style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
    );
  }
}
