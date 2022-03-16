import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/app_constants.dart';

class RandomUserRepo  extends GetxService{


  Future<Response> getAllRandomUser() async {
    http.Response response = await http.get(Uri.parse(AppConstants.randomUserApi)).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    return res;
  }
}
