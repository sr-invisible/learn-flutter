
import 'package:get/get.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/controller/notification_controller.dart';
import 'package:learn_flutter/controller/random_user_controller.dart';
import 'package:learn_flutter/controller/university_controller.dart';
import 'package:learn_flutter/data/repository/notification_repo.dart';
import 'package:learn_flutter/data/repository/random_user_repo.dart';
import 'package:learn_flutter/data/repository/university_repo.dart';

Future<void> init()  async {

  Get.lazyPut(() => RandomUserRepo());
  Get.lazyPut(() => NotificationRepo());
  Get.lazyPut(() => UniversityRepo());


  Get.lazyPut(() => RandomUserController(randomUserRepo: Get.find()));
  Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));
  Get.lazyPut(() => LocationController());
  Get.lazyPut(() => UniversityController(universityRepo: Get.find()));
}