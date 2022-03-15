import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/controller/university_controller.dart';

class UniversityDetailsDialog extends StatelessWidget {
  const UniversityDetailsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: GetBuilder<UniversityController>(
          builder: (universityController) {
            return universityController.universityDetails != null ? Container(
                height: 200, width:MediaQuery.of(context).size.width,padding: const EdgeInsets.symmetric( horizontal: 25),
                decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius:BorderRadius.circular(5), boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(.5),offset: const Offset(0,1),blurRadius: 5)
                ]),
                child:  Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ const SizedBox(height: 25),
              Text('${'name'.tr} : ${universityController.universityDetails![0].name}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),
              Text('${'country'.tr} : ${universityController.universityDetails![0].country}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),
              Text('${'alpha_two_code'.tr} : ${universityController.universityDetails![0].alphaTwoCode}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),
              Text('${'state-province'.tr} : ${universityController.universityDetails![0].stateProvince}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),
              Text('${'domain'.tr} : ${universityController.universityDetails![0].domains![0]}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),
                  Text('${'web'.tr} : ${universityController.universityDetails![0].webPages![0]}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  const SizedBox(height: 10),

                ])) : Container();
          }
        ),
      ),
    );
  }
}
