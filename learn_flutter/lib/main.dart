import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/view/screen/home_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

 FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

//receive message when app is in background 
Future<void> backgroundHandler(RemoteMessage m) async {
  print(m.data.toString());
  print(m.notification!.title);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
