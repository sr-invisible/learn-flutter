import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/app_constants.dart';
class CountryRepo {

  Future<Response> getAllCountries() async {
    http.Response response = await http.get(Uri.parse(AppConstants.countryApi));
    var body = jsonDecode(response.body);
    // debugPrint('-----------------cc GetCountries body-----> $body');
    Response res = Response(body:body, statusCode: 200);

    return res;
  }
  Future<Response> countryDetailsByName(String name) async {
    http.Response response = await http.get(Uri.parse(AppConstants.placeDetailsByPlaceIdApi));
    var body = jsonDecode(response.body);
    debugPrint('-----------------ccc----placeDetailsByPlaceId body-----> $body');
    Response res = Response(body:body, statusCode: 200);

    return res;
  }


}