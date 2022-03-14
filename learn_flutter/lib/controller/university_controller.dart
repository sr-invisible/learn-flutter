
import 'package:get/get.dart';
import 'package:learn_flutter/data/model/response/university_model.dart';
import 'package:learn_flutter/data/repository/university_repo.dart';

class UniversityController extends GetxController implements GetxService {
  final UniversityRepo universityRepo;
  UniversityController({required this.universityRepo});

  UniversityModel? _universityModel;
  UniversityModel get universityModel => _universityModel!;

   List<UniversityModel>? _universityList = [];
  List<UniversityModel>? get universityList => _universityList!;


  Future<void> getUniversities() async {
    Response response = await universityRepo.getAllUniversities();
    if (response.statusCode == 200) {
      _universityList =[];
      response.body.forEach((university) => _universityList?.add(UniversityModel.fromJson(university)));


    }
    update();
  }






}
