import 'package:get/get.dart';
import 'package:learn_flutter/data/model/response/random_user_model.dart';
import 'package:learn_flutter/data/repository/random_user_repo.dart';

class RandomUserController extends GetxController implements GetxService {
  final RandomUserRepo randomUserRepo;
  RandomUserController({required this.randomUserRepo});

  RandomUserModel? _randomUserModel;
  List<RandomUserModel>? _randomUserModelList;
  Results? _results;
  List<Results>? _resultList;

  RandomUserModel get randomUserModel => _randomUserModel!;
  List<RandomUserModel> get randomUserModelList => _randomUserModelList!;
  Results get userInfo => _results!;
  List<Results>? get userInfoList => _resultList!;

  Future<void> getAllRandomUser() async {
    Response response = await randomUserRepo.getAllRandomUser();
    _resultList = [];

    if (response.statusCode == 200) {
      _randomUserModelList = [];
      _resultList!.addAll(RandomUserModel.fromJson(response.body).userResults);

    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllRandomUser();
  }
}
