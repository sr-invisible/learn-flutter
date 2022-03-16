
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/data/model/response/university_model.dart';
import 'package:learn_flutter/data/repository/university_repo.dart';

class UniversityController extends GetxController implements GetxService {
  final UniversityRepo universityRepo;
  UniversityController({required this.universityRepo});

  UniversityModel? _universityModel;
  final List<UniversityModel>  _universityList = [];
  final List<UniversityModel>  _universityDetails = [];
  bool _isLoading = false;
  bool _isVisible = false;


  UniversityModel get universityModel => _universityModel!;
  List<UniversityModel> get universityList => _universityList;
  List<UniversityModel> get universityDetails => _universityDetails;
  bool get isLoading => _isLoading;
  bool get isVasible => _isVisible;


  Future<void> getUniversities() async {
    Response response = await universityRepo.getAllUniversities();
    if (response.statusCode == 200) {
      response.body.forEach((university) => _universityList.add(UniversityModel.fromJson(university)));
    }
    _isLoading = false;
    update();
  }
  Future<void> getUniversitiesByCountry(String country) async {
    Response response = await universityRepo.getAllUniversitiesByCountry(country);
    if (response.statusCode == 200) {
      response.body.forEach((university) => _universityList.add(UniversityModel.fromJson(university)));
    }
    _isLoading = false;
    _isVisible = true;
    debugPrint('-----------------cc University body-----> ${_universityList.length}');
    update();
  }
  Future<void> getUniversityDetailsByName(String countryName, String universityName) async {
    Response response = await universityRepo.getUniversityDetailsByName(countryName,universityName);
    if (response.statusCode == 200) {
      response.body.forEach((university) => _universityDetails.add(UniversityModel.fromJson(university)));
    }
    _isLoading = false;
    update();
  }







}
