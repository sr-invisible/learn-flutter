class AddressModel {
  int? id;
  String? addressType;
  String? address;
  String? latitude;
  String? longitude;
  int? zoneId;
  String? method;

  AddressModel(
      {this.id,
        this.addressType,
        this.address,
        this.latitude,
        this.longitude,
        this.zoneId,
        this.method});

}
