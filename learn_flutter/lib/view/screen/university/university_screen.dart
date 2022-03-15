import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/controller/country_controller.dart';
import 'package:learn_flutter/controller/university_controller.dart';
import 'package:learn_flutter/view/screen/university/university_details_dialog.dart';

class UniversityScreen extends StatefulWidget {

   UniversityScreen({Key? key}) : super(key: key);

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  String _selectedCountry = '';

  @override
  Widget build(BuildContext context) {

    Get.find<CountryController>().getAllCountries();
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text('University')),
      body: SingleChildScrollView(
        child: Column(children: [
            Center(child: GetBuilder<CountryController>(
              builder: (countryController) {
                return DropdownButton(
                      alignment: Alignment.center,
                      hint: Text(countryController.selectedCountry == null ? 'Please choose a country' : '' ),

                      onChanged: (newValue) {
                        _selectedCountry = newValue as String;
                        Get.find<UniversityController>().getUniversitiesByCountry(newValue);
                        countryController.setSelectedCountry(newValue);
                        },

                        value: countryController.selectedCountry,

                    items: Get.find<CountryController>().countries!.map((country) {

                        return DropdownMenuItem(
                          child: Row(mainAxisSize: MainAxisSize.min,children: [
                              FadeInImage(
                                placeholder: const NetworkImage('https://www.leadershipmartialartsct.com/wp-content/uploads/2017/04/default-image-620x600.jpg'),
                                image: NetworkImage(country.flags!.png!),
                              height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 25),
                              Text(country.name!.common!),
                            ],
                          ),
                          value: country.name!.common!,
                        );
                      }).toList()

                );
              }
            )),

            GetBuilder<UniversityController>(builder: (universityController) {
              return universityController.universityList != null ?

               GridView.builder(
                itemCount: universityController.universityList!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 10/3.2
                  ),
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      universityController.getUniversityDetailsByName(universityController.universityList![index].country!,universityController.universityList![index].name!);
                      Get.dialog( const UniversityDetailsDialog());
                      debugPrint('---------rrr single university');
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            boxShadow: [ BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 1)) ]),
                        child: Column(mainAxisSize:MainAxisSize.min,children: [ const SizedBox(height: 25),
                          ListTile(
                            leading: CircleAvatar(child: Text('$index')),
                            title:   Text('${universityController.universityList![index].name}', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              Text('${universityController.universityList![index].country}'),
                              const SizedBox(height: 10),
                              Text(universityController.universityList![index].webPages![0]),
                            ])),
                        //   const SizedBox(height: 5),
                        // const Divider(),
                      ],),),
                  ),
                );
              }) :  Container() ;

            }
            ),
          ],
        ),
      ),

    ));
  }
}

