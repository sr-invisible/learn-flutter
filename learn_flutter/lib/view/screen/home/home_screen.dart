import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/controller/random_user_controller.dart';
import 'package:learn_flutter/helper/route_helper.dart';
import 'package:learn_flutter/util/app_constants.dart';
import 'package:learn_flutter/util/images.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
            // GetBuilder<RandomUserController>(builder: (randomUserController) {
            //     // return randomUserController.userInfoList != null ?
            //     return GridView.builder(
            //          itemCount:randomUserController.userInfoList!.length,
            //          physics: const NeverScrollableScrollPhysics(),
            //          shrinkWrap: true,
            //          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //            crossAxisCount: 1,
            //          ),
            //          itemBuilder: (context,index) {
            //       return Container(alignment: Alignment.center,
            //          margin: const EdgeInsets.all(20),
            //          padding: const EdgeInsets.all(20),
            //          decoration: BoxDecoration(color: Colors.white,
            //              boxShadow: [ BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 1)) ]),
            //
            //          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //              CircleAvatar(backgroundImage: NetworkImage('${randomUserController.userInfoList![index].picture!.medium}'), radius: 65,),
            //              const SizedBox(height: 5),
            //              Text('full_name'.tr +' : ${randomUserController.userInfoList![index].name!.first} ${randomUserController.userInfoList![index].name!.last}'),
            //              Text('user_name'.tr +' : ${randomUserController.userInfoList![index].login!.username}'),
            //              Text('email'.tr+' : ${randomUserController.userInfoList![index].email}'),
            //              Text('phone'.tr +' : ${randomUserController.userInfoList![index].phone}'),
            //              Text('date_of_birth'.tr +' : ${randomUserController.userInfoList![index].dob!.date}'),
            //              Text('age'.tr +' : ${randomUserController.userInfoList![index].dob!.age}'),
            //              Text('gender'.tr + ' : ${randomUserController.userInfoList![index].gender}'),
            //
            //            ]));
            //
            //      });
            //   }),

            ElevatedButton(onPressed: () => Get.toNamed(RouteHelper.university), child: const Text('University list')),
          ],
        ),
      ),

    ));
  }
}
