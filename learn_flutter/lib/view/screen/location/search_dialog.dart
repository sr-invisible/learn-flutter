import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:learn_flutter/controller/location_controller.dart';
import 'package:learn_flutter/data/model/response/place_auto_completeModel.dart';

class LocationSearchDialog extends StatelessWidget {
  final GoogleMapController? mapController;
  const LocationSearchDialog({Key? key, @required this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _textController = TextEditingController();

    return Container(

      padding: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
            height: 50, padding: const EdgeInsets.symmetric( horizontal: 10),
            decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius:BorderRadius.circular(5), boxShadow: [
              BoxShadow(color: Colors.blue.withOpacity(.5),offset: const Offset(0,1),blurRadius: 5)
            ]),
            child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _textController,
            textInputAction: TextInputAction.search,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              hintText: 'search_location'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.none, width: 0),
              ),
              hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 10, color: Theme.of(context).disabledColor,
              ),
              filled: true, fillColor: Theme.of(context).cardColor,
            ),
            style: Theme.of(context).textTheme.headline2!.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color, fontSize:15,
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await Get.find<LocationController>().searchLocation(context, pattern);
          },
          itemBuilder: (context, Predictions suggestion) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                const Icon(Icons.location_on),
                Expanded(
                  child: Text(suggestion.description!, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color, fontSize:15,
                  )),
                ),
              ]),
            );
          },
          onSuggestionSelected: (Predictions suggestion) {
            Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
            Get.back();
          },
        )),
      ),
    );
  }
}
