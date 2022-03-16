
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/data/model/response/country_model.dart';
import 'package:learn_flutter/data/repository/country_repo.dart';

class CountryController extends GetxController implements GetxService {
  final CountryRepo countryRepo;
  CountryController({required this.countryRepo});

  CountryModel? _countryModel;
  List<CountryModel> _countries = [];
  final List<CountryModel> _universityDetails = [];
  String? _selectedCountry;
  bool _isLoading = false;


  CountryModel get country => _countryModel!;
  List<CountryModel> get countries => _countries;
  List<CountryModel> get countryDetails => _universityDetails;
  String? get selectedCountry => _selectedCountry;
  bool get isLoading => _isLoading;


  Future<void> getAllCountries() async {
    Response response = await countryRepo.getAllCountries();
    if (response.statusCode == 200) {
      response.body.forEach((country) => _countries.add(CountryModel.fromJson(country)));
    }
    _isLoading = false;
    debugPrint('-----------------cc GetCountries body-----> $_countries');
    update();
  }
  void setSelectedCountry(String value){
    _selectedCountry = value;
    update();
  }
  // Future<void> getCountryDetailsByName(String name) async {
  //   Response response = await countryRepo.ge(name);
  //   if (response.statusCode == 200) {
  //     _universityDetails =[];
  //     response.body.forEach((university) => _universityDetails?.add(CountryModel.fromJson(university)));
  //   }
  //   update();
  // }







}
