import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/util/app_constants.dart';

class UniversityRepo {


  Future<Response> getAllUniversities() async {
    http.Response response = await http.get(Uri.parse(AppConstants.universitiesApi+'?country=bangladesh')).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    return res;
  }
  Future<Response> getAllUniversitiesByCountry(String country) async {
    http.Response response = await http.get(Uri.parse(AppConstants.universitiesApi+'?country=$country')).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    debugPrint('-----------------gg getAllUniversitiesByCountry Repo body-----> $body <----');
    return res;
  }
  Future<Response> getUniversityDetailsByName(String countryName, String universityName) async {
    http.Response response = await http.get(Uri.parse(AppConstants.universitiesApi+ '?country=$countryName&name=$universityName')).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    return res;
  }
}
