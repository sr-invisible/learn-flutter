import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/controller/university_controller.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.find<UniversityController>().getUniversities();
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text('University')),
      body: GetBuilder<UniversityController>(builder: (universityController) {
        return universityController.universityList != null ? GridView.builder(
          itemCount: universityController.universityList!.length,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 10/3.4
            ),
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [ BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 1)) ]),
              child: Column(children: [
                const SizedBox(height: 25),
                ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title:   Text('${universityController.universityList![index].name}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('${universityController.universityList![index].country}'),
                    const SizedBox(height: 10),
                    Text(universityController.universityList![index].webPages![0]),
                  ])),
                const SizedBox(height: 5),
              const Divider(),
            ],),),
          );
        }) : const CircularProgressIndicator();
      }
      ),

    ));
  }
}

