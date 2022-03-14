class UniversityModel {
  String? country;
  String? name;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;
  List<String>? webPages;

  UniversityModel(
      {this.country,
        this.name,
        this.domains,
        this.alphaTwoCode,
        this.stateProvince,
        this.webPages});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['name'] = name;
    data['domains'] = domains;
    data['alpha_two_code'] = alphaTwoCode;
    data['state-province'] = stateProvince;
    data['web_pages'] = webPages;
    return data;
  }
}
