import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/data/model/notification_model.dart';
import 'package:learn_flutter/data/repository/notification_repo.dart';

class NotificationController extends GetxController implements GetxService {
  final NotificationRepo notificationRepo;
  NotificationController({required this.notificationRepo});

  List<NotificationModel>? _notificationList;

  List<NotificationModel> get notification => _notificationList!;
RemoteMessage? message;
 void getNotification()  {
    notificationRepo.getMessage(message!);



  }




}
