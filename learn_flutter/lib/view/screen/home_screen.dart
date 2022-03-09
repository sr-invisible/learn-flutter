import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();

    //forground work
    FirebaseMessaging.onMessage.listen((m) {
      if(m.notification != null){
        print(m.notification!.body);
        print(m.notification!.title);
      }
    });
    //when the app is in background but opened and user tap on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((m) {
      final routeFromMessage = m.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
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
