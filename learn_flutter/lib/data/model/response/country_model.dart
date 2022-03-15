class CountryModel {
  Name? name;

  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  // Idd? idd;
  // List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<int>? latlng;
  bool? landlocked;
  // List<String>? borders;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  Flags? coatOfArms;
  String? startOfWeek;
  PostalCode? postalCode;

  CountryModel(
      {this.name,

        this.cca2,
        this.ccn3,
        this.cca3,
        this.cioc,
        this.independent,
        this.status,
        this.unMember,
        this.currencies,
        // this.idd,
        // this.capital,
        this.altSpellings,
        this.region,
        this.subregion,
        this.languages,
        this.translations,
        this.latlng,
        this.landlocked,
        // this.borders,
        this.area,
        this.demonyms,
        this.flag,
        this.maps,
        this.population,
        this.gini,
        this.fifa,
        this.timezones,
        this.continents,
        this.flags,
        this.coatOfArms,
        this.startOfWeek,

        this.postalCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    // tld = json['tld'].cast<String>();
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    // idd = json['idd'] != null ? Idd.fromJson(json['idd']) : null;
    // capital = json['capital'].cast<String>();
    altSpellings = json['altSpellings'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'].cast<int>();
    landlocked = json['landlocked'];
    // borders = json['borders'].cast<String>();
    area = json['area'];
    demonyms = json['demonyms'] != null
        ? Demonyms.fromJson(json['demonyms'])
        : null;
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    gini = json['gini'] != null ? Gini.fromJson(json['gini']) : null;
    fifa = json['fifa'];
    timezones = json['timezones'].cast<String>();
    continents = json['continents'].cast<String>();
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms = json['coatOfArms'] != null
        ? Flags.fromJson(json['coatOfArms'])
        : null;
    startOfWeek = json['startOfWeek'];

    postalCode = json['postalCode'] != null
        ? PostalCode.fromJson(json['postalCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }

    data['cca2'] = this.cca2;
    data['ccn3'] = this.ccn3;
    data['cca3'] = this.cca3;
    data['cioc'] = this.cioc;
    data['independent'] = this.independent;
    data['status'] = this.status;
    data['unMember'] = this.unMember;
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.toJson();
    }
    // if (this.idd != null) {
    //   data['idd'] = this.idd!.toJson();
    // }
    // data['capital'] = this.capital;
    data['altSpellings'] = this.altSpellings;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    if (this.languages != null) {
      data['languages'] = this.languages!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.toJson();
    }
    data['latlng'] = this.latlng;
    data['landlocked'] = this.landlocked;
    // data['borders'] = this.borders;
    data['area'] = this.area;
    if (this.demonyms != null) {
      data['demonyms'] = this.demonyms!.toJson();
    }
    data['flag'] = this.flag;
    if (this.maps != null) {
      data['maps'] = this.maps!.toJson();
    }
    data['population'] = this.population;
    if (this.gini != null) {
      data['gini'] = this.gini!.toJson();
    }
    data['fifa'] = this.fifa;

    data['timezones'] = this.timezones;
    data['continents'] = this.continents;
    if (this.flags != null) {
      data['flags'] = this.flags!.toJson();
    }
    if (this.coatOfArms != null) {
      data['coatOfArms'] = this.coatOfArms!.toJson();
    }
    data['startOfWeek'] = this.startOfWeek;

    if (this.postalCode != null) {
      data['postalCode'] = this.postalCode!.toJson();
    }
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    if (this.nativeName != null) {
      data['nativeName'] = this.nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Spa? spa;

  NativeName({this.spa});

  NativeName.fromJson(Map<String, dynamic> json) {
    spa = json['spa'] != null ? Spa.fromJson(json['spa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.spa != null) {
      data['spa'] = this.spa!.toJson();
    }
    return data;
  }
}

class Spa {
  String? official;
  String? common;

  Spa({this.official, this.common});

  Spa.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['official'] = this.official;
    data['common'] = this.common;
    return data;
  }
}

class Currencies {
  UYU? uYU;

  Currencies({this.uYU});

  Currencies.fromJson(Map<String, dynamic> json) {
    uYU = json['UYU'] != null ? UYU.fromJson(json['UYU']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.uYU != null) {
      data['UYU'] = this.uYU!.toJson();
    }
    return data;
  }
}

class UYU {
  String? name;
  String? symbol;

  UYU({this.name, this.symbol});

  UYU.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

// class Idd {
//   String? root;
//   List<String>? suffixes;
//
//   Idd({this.root, this.suffixes});
//
//   Idd.fromJson(Map<String, dynamic> json) {
//     root = json['root'];
//     suffixes = json['suffixes'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['root'] = this.root;
//     data['suffixes'] = this.suffixes;
//     return data;
//   }
// }

class Languages {
  String? spa;

  Languages({this.spa});

  Languages.fromJson(Map<String, dynamic> json) {
    spa = json['spa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['spa'] = this.spa;
    return data;
  }
}

class Translations {
  Spa? ara;
  Spa? ces;
  Spa? cym;
  Spa? deu;
  Spa? est;
  Spa? fin;
  Eng? fra;
  Spa? hrv;
  Spa? hun;
  Spa? ita;
  Spa? jpn;
  Spa? kor;
  Spa? nld;
  Spa? per;
  Spa? pol;
  Spa? por;
  Spa? rus;
  Spa? slk;
  Spa? spa;
  Spa? swe;
  Spa? urd;
  Spa? zho;

  Translations(
      {this.ara,
        this.ces,
        this.cym,
        this.deu,
        this.est,
        this.fin,
        this.fra,
        this.hrv,
        this.hun,
        this.ita,
        this.jpn,
        this.kor,
        this.nld,
        this.per,
        this.pol,
        this.por,
        this.rus,
        this.slk,
        this.spa,
        this.swe,
        this.urd,
        this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Spa.fromJson(json['ara']) : null;
    ces = json['ces'] != null ? Spa.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Spa.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Spa.fromJson(json['deu']) : null;
    est = json['est'] != null ? Spa.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Spa.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Spa.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Spa.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Spa.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Spa.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Spa.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Spa.fromJson(json['nld']) : null;
    per = json['per'] != null ? Spa.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Spa.fromJson(json['pol']) : null;
    por = json['por'] != null ? Spa.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Spa.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Spa.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Spa.fromJson(json['spa']) : null;
    swe = json['swe'] != null ? Spa.fromJson(json['swe']) : null;
    urd = json['urd'] != null ? Spa.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Spa.fromJson(json['zho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.ara != null) {
      data['ara'] = this.ara!.toJson();
    }
    if (this.ces != null) {
      data['ces'] = this.ces!.toJson();
    }
    if (this.cym != null) {
      data['cym'] = this.cym!.toJson();
    }
    if (this.deu != null) {
      data['deu'] = this.deu!.toJson();
    }
    if (this.est != null) {
      data['est'] = this.est!.toJson();
    }
    if (this.fin != null) {
      data['fin'] = this.fin!.toJson();
    }
    if (this.fra != null) {
      data['fra'] = this.fra!.toJson();
    }
    if (this.hrv != null) {
      data['hrv'] = this.hrv!.toJson();
    }
    if (this.hun != null) {
      data['hun'] = this.hun!.toJson();
    }
    if (this.ita != null) {
      data['ita'] = this.ita!.toJson();
    }
    if (this.jpn != null) {
      data['jpn'] = this.jpn!.toJson();
    }
    if (this.kor != null) {
      data['kor'] = this.kor!.toJson();
    }
    if (this.nld != null) {
      data['nld'] = this.nld!.toJson();
    }
    if (this.per != null) {
      data['per'] = this.per!.toJson();
    }
    if (this.pol != null) {
      data['pol'] = this.pol!.toJson();
    }
    if (this.por != null) {
      data['por'] = this.por!.toJson();
    }
    if (this.rus != null) {
      data['rus'] = this.rus!.toJson();
    }
    if (this.slk != null) {
      data['slk'] = this.slk!.toJson();
    }
    if (this.spa != null) {
      data['spa'] = this.spa!.toJson();
    }
    if (this.swe != null) {
      data['swe'] = this.swe!.toJson();
    }
    if (this.urd != null) {
      data['urd'] = this.urd!.toJson();
    }
    if (this.zho != null) {
      data['zho'] = this.zho!.toJson();
    }
    return data;
  }
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.eng != null) {
      data['eng'] = this.eng!.toJson();
    }
    if (this.fra != null) {
      data['fra'] = this.fra!.toJson();
    }
    return data;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['f'] = this.f;
    data['m'] = this.m;
    return data;
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['googleMaps'] = this.googleMaps;
    data['openStreetMaps'] = this.openStreetMaps;
    return data;
  }
}

class Gini {
  double? d2019;

  Gini({this.d2019});

  Gini.fromJson(Map<String, dynamic> json) {
    d2019 = json['2019'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['2019'] = this.d2019;
    return data;
  }
}



class Flags {
  String? png;
  String? svg;

  Flags({this.png, this.svg});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['png'] = this.png;
    data['svg'] = this.svg;
    return data;
  }
}



class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['format'] = this.format;
    data['regex'] = this.regex;
    return data;
  }
}
