import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/services/local_notification_service.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // gives you the message on which user taps and if opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((m) {
      if(m!.notification != null) {
        final routeFromMessage = m.data["route"];
        Navigator.pushNamed(context, '/$routeFromMessage');
        print(m.notification!.body);
        print(m.notification!.title);
      }
    });
    // FirebaseMessaging.instance.getInitialMessage();

    //forground work
    FirebaseMessaging.onMessage.listen((m) {
      if(m.notification != null){
        print(m.notification!.body);
        print(m.notification!.title);
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
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Learn Flutter')),
      body: Text('sdf'),

    ));
  }
}
