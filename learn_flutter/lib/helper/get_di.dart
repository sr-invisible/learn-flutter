
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/controller/notification_controller.dart';
import 'package:learn_flutter/data/repository/notification_repo.dart';

Future<void> init()  async {
  Get.lazyPut(() => NotificationRepo());
  Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));
  Get.lazyPut(() => LocationController());
}