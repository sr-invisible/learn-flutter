import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/controller/random_user_controller.dart';
import 'package:learn_flutter/helper/route_helper.dart';
import 'package:learn_flutter/services/local_notification_service.dart';
import 'package:learn_flutter/util/app_constants.dart';
import 'package:learn_flutter/util/images.dart';

class HomeScreen extends StatefulWidget {
 final String? address;
 const HomeScreen({Key? key, required this.address}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    // gives you the message on which user taps and if opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((m) {

        final routeFromMessage = m!.data["route"];
        Navigator.pushNamed(context, '/$routeFromMessage');
        if (kDebugMode) {
          print(m.notification!.body);
          print(m.notification!.title);
        }


    });
    // FirebaseMessaging.instance.getInitialMessage();

    //foreground work
    FirebaseMessaging.onMessage.listen((m) {
      if(m.notification != null){
        if (kDebugMode) {
          print(m.notification!.body);
          print(m.notification!.title);
        }
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
    Get.find<LocationController>().getCurrentAddress;
    Get.find<RandomUserController>().getAllRandomUser();
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:  InkWell( onTap: () => Get.offNamed(RouteHelper.gMap),child:
      GetBuilder<LocationController>(builder: (locationController) {
        return Row(children: [
          Image.asset(Images.marker, width: 25,height: 20, color: Colors.white),
          Text( locationController.address != null ? '${locationController.address}' : AppConstants.appName, style: const TextStyle(fontSize: 12)), ]
        );
      }))),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<RandomUserController>(builder: (randomUserController) {
                // return randomUserController.userInfoList != null ?
                return GridView.builder(
                     itemCount:randomUserController.userInfoList!.length,
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 1,
                     ),
                     itemBuilder: (context,index) {
                  return Container(alignment: Alignment.center,
                     margin: const EdgeInsets.all(20),
                     padding: const EdgeInsets.all(20),
                     decoration: BoxDecoration(color: Colors.white,
                         boxShadow: [ BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 1)) ]),

                     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                         CircleAvatar(backgroundImage: NetworkImage('${randomUserController.userInfoList![index].picture!.medium}'), radius: 65,),
                         const SizedBox(height: 5),
                         Text('full_name : ${randomUserController.userInfoList![index].name!.first} ${randomUserController.userInfoList![index].name!.last}'.tr),
                         Text('user_name : ${randomUserController.userInfoList![index].login!.username}'.tr),
                         Text('email : ${randomUserController.userInfoList![index].email}'.tr),
                         Text('phone : ${randomUserController.userInfoList![index].phone}'.tr),
                         Text('date_of_birth : ${randomUserController.userInfoList![index].dob!.date}'.tr),
                         Text('age : ${randomUserController.userInfoList![index].dob!.age}'.tr),
                         Text('gender : ${randomUserController.userInfoList![index].gender}'.tr),

                       ]));

                 });
              }),

            ElevatedButton(onPressed: () => Get.toNamed(RouteHelper.university), child: const Text('University list')),
          ],
        ),
      ),

    ));
  }
}
