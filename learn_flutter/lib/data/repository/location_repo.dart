import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/app_constants.dart';
class LocationRepo {

  Future<Response> searchLocation(String searchText) async {
    http.Response response = await http.get(Uri.parse(AppConstants.placeAutoCompleteApi+'?input=$searchText&location=37.76999%2C-122.44696&radius=500&types=establishment&key=${AppConstants.googleApiKey}'));
    var body = jsonDecode(response.body);
    // debugPrint('-----------------search location body-----> $body');
    Response res = Response(body:body, statusCode: 200);

    return res;
  }
  Future<Response> placeDetailsByPlaceId(String placeId) async {
    http.Response response = await http.get(Uri.parse(AppConstants.placeDetailsByPlaceIdApi+'?placeid=$placeId&key=${AppConstants.googleApiKey}'));
    var body = jsonDecode(response.body);
    debugPrint('-----------------xxxx----placeDetailsByPlaceId body-----> $body');
    Response res = Response(body:body, statusCode: 200);

    return res;
  }


}