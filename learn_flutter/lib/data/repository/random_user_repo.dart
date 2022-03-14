import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/app_constants.dart';

class RandomUserRepo {


  Future<Response> getAllRandomUser() async {
    http.Response response = await http.get(Uri.parse(AppConstants.randomUserApi)).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    return res;
  }
}
