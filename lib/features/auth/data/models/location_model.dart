class LocationModel {
  Response response;

  LocationModel({this.response});

  LocationModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response.toJson();
      return data;
  }
}

class Response {
  GeoObjectCollection geoObjectCollection;

  Response({this.geoObjectCollection});

  Response.fromJson(Map<String, dynamic> json) {
    geoObjectCollection = json['GeoObjectCollection'] != null
        ? GeoObjectCollection.fromJson(json['GeoObjectCollection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GeoObjectCollection'] = geoObjectCollection.toJson();
      return data;
  }
}

class GeoObjectCollection {
  MetaDataProperty metaDataProperty;
  List<FeatureMember> featureMember;

  GeoObjectCollection({this.metaDataProperty, this.featureMember});

  GeoObjectCollection.fromJson(Map<String, dynamic> json) {
    metaDataProperty = json['metaDataProperty'] != null
        ? MetaDataProperty.fromJson(json['metaDataProperty'])
        : null;
    if (json['featureMember'] != null) {
      featureMember = List<FeatureMember>();
      json['featureMember'].forEach((v) {
        featureMember.add(FeatureMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['metaDataProperty'] = metaDataProperty.toJson();
      data['featureMember'] =
        featureMember.map((v) => v.toJson()).toList();
      return data;
  }
}

class MetaDataProperty {
  GeocoderResponseMetaData geocoderResponseMetaData;

  MetaDataProperty({this.geocoderResponseMetaData});

  MetaDataProperty.fromJson(Map<String, dynamic> json) {
    geocoderResponseMetaData = json['GeocoderResponseMetaData'] != null
        ? GeocoderResponseMetaData.fromJson(
        json['GeocoderResponseMetaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.geocoderResponseMetaData != null) {
      data['GeocoderResponseMetaData'] = this.geocoderResponseMetaData.toJson();
    }
    return data;
  }
}

class GeocoderResponseMetaData {
  Point point;
  String request;
  String results;
  String found;

  GeocoderResponseMetaData(
      {this.point, this.request, this.results, this.found});

  GeocoderResponseMetaData.fromJson(Map<String, dynamic> json) {
    point = json['Point'] != null ? Point.fromJson(json['Point']) : null;
    request = json['request'];
    results = json['results'];
    found = json['found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Point'] = point.toJson();
      data['request'] = request;
    data['results'] = results;
    data['found'] = found;
    return data;
  }
}

class Point {
  String pos;

  Point({this.pos});

  Point.fromJson(Map<String, dynamic> json) {
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pos'] = pos;
    return data;
  }
}

class FeatureMember {
  GeoObject geoObject;

  FeatureMember({this.geoObject});

  FeatureMember.fromJson(Map<String, dynamic> json) {
    geoObject = json['GeoObject'] != null
        ? GeoObject.fromJson(json['GeoObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GeoObject'] = geoObject.toJson();
      return data;
  }
}

class GeoObject {
  MetaDataProperty metaDataProperty;
  String name;
  String description;
  BoundedBy boundedBy;
  String uri;
  Point point;

  GeoObject(
      {this.metaDataProperty,
        this.name,
        this.description,
        this.boundedBy,
        this.uri,
        this.point});

  GeoObject.fromJson(Map<String, dynamic> json) {
    metaDataProperty = json['metaDataProperty'] != null
        ? MetaDataProperty.fromJson(json['metaDataProperty'])
        : null;
    name = json['name'];
    description = json['description'];
    boundedBy = json['boundedBy'] != null
        ? BoundedBy.fromJson(json['boundedBy'])
        : null;
    uri = json['uri'];
    point = json['Point'] != null ? Point.fromJson(json['Point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['metaDataProperty'] = metaDataProperty.toJson();
      data['name'] = name;
    data['description'] = description;
    data['boundedBy'] = boundedBy.toJson();
      data['uri'] = uri;
    data['Point'] = point.toJson();
      return data;
  }
}

class MetaDataProperty {
  GeocoderMetaData? geocoderMetaData;

  MetaDataProperty({required this.geocoderMetaData});

  MetaDataProperty.fromJson(Map<String, dynamic> json) {
    geocoderMetaData = json['GeocoderMetaData'] != null
        ? GeocoderMetaData.fromJson(json['GeocoderMetaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GeocoderMetaData'] = geocoderMetaData.toJson();
      return data;
  }
}

class GeocoderMetaData {
  String precision;
  String text;
  String kind;
  Address? address;
  AddressDetails addressDetails;

  GeocoderMetaData(
      {required this.precision,
        required this.text,
        required this.kind,
        required this.address,
        required this.addressDetails});

  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) {
   String precision = json['precision'];
   String text = json['text'];
  String  kind = json['kind'];
   Address? address =Address.fromJson(json['Address']);
AddressDetails    addressDetails = AddressDetails.fromJson(json['AddressDetails']);
return GeocoderMetaData(precision: precision, text: text, kind: kind, address: address, addressDetails: addressDetails);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['precision'] = precision;
    data['text'] = text;
    data['kind'] = kind;
    data['Address'] = address?.toJson();
      data['AddressDetails'] = addressDetails.toJson();
      return data;
  }
}

class Address {
  String countryCode;
  String formatted;
  List<Components>? components;

  Address({required this.countryCode,required this.formatted,required this.components});

 factory Address.fromJson(Map<String, dynamic> json) {
 String   countryCode = json['country_code'];
  String  formatted = json['formatted'];
  List<Components>? components = json['components'];
    if (json['Components'] != null) {
    List<Components>  components = [];
      json['Components'].forEach((v) {
        components.add(Components.fromJson(v));
      });
    }
    return Address(countryCode: countryCode, formatted: formatted, components: components);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_code'] = countryCode;
    data['formatted'] = formatted;
    data['Components'] = components?.map((v) => v.toJson()).toList();
      return data;
  }
}

class Components {
  String kind;
  String name;

  Components({required this.kind,required this.name});

  factory Components.fromJson(Map<String, dynamic> json) {
   String kind = json['kind'];
   String name = json['name'];
   return Components(kind: kind, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['name'] = name;
    return data;
  }
}

class AddressDetails {
  Country country;
  String address;

  AddressDetails({required this.country,required this.address});

  factory AddressDetails.fromJson(Map<String, dynamic> json) {
 Country   country =Country.fromJson(json['Country']);
   String address = json['Address'];
   return AddressDetails(country: country, address: address);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Country'] = country.toJson();
      data['Address'] = address;
    return data;
  }
}

class Country {
  String addressLine;
  String countryNameCode;
  String countryName;
  AdministrativeArea administrativeArea;

  Country(
      {required this.addressLine,
        required this.countryNameCode,
        required this.countryName,
        required this.administrativeArea});

factory  Country.fromJson(Map<String, dynamic> json) {
   String addressLine = json['AddressLine'];
   String countryNameCode = json['CountryNameCode'];
   String countryName = json['CountryName'];
   AdministrativeArea administrativeArea = AdministrativeArea.fromJson(json['AdministrativeArea']);
   return Country(addressLine: addressLine, countryNameCode: countryNameCode, countryName: countryName, administrativeArea: administrativeArea);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AddressLine'] = addressLine;
    data['CountryNameCode'] = countryNameCode;
    data['CountryName'] = countryName;
    data['AdministrativeArea'] = administrativeArea.toJson();
      return data;
  }
}

class AdministrativeArea {
  String administrativeAreaName;
  SubAdministrativeArea subAdministrativeArea;

  AdministrativeArea({required this.administrativeAreaName,required this.subAdministrativeArea});

 factory AdministrativeArea.fromJson(Map<String, dynamic> json) {
  String  administrativeAreaName = json['AdministrativeAreaName'];
  SubAdministrativeArea  subAdministrativeArea =SubAdministrativeArea.fromJson(json['SubAdministrativeArea']);
  return AdministrativeArea(administrativeAreaName: administrativeAreaName, subAdministrativeArea: subAdministrativeArea);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AdministrativeAreaName'] = administrativeAreaName;
    data['SubAdministrativeArea'] = subAdministrativeArea.toJson();
      return data;
  }
}

class SubAdministrativeArea {
  String subAdministrativeAreaName;

  SubAdministrativeArea({required this.subAdministrativeAreaName});

 factory SubAdministrativeArea.fromJson(Map<String, dynamic> json) {
   String subAdministrativeAreaName = json['SubAdministrativeAreaName'];
   return SubAdministrativeArea(subAdministrativeAreaName: subAdministrativeAreaName);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SubAdministrativeAreaName'] = subAdministrativeAreaName;
    return data;
  }
}

class BoundedBy {
  Envelope envelope;

  BoundedBy({required this.envelope});

 factory BoundedBy.fromJson(Map<String, dynamic> json) {
   Envelope envelope =Envelope.fromJson(json['Envelope']);
   return BoundedBy(envelope: envelope);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Envelope'] = envelope.toJson();
      return data;
  }
}

class Envelope {
  String lowerCorner;
  String upperCorner;

  Envelope({required this.lowerCorner,required this.upperCorner});

  factory Envelope.fromJson(Map<String, dynamic> json) {
   String lowerCorner = json['lowerCorner'];
   String upperCorner = json['upperCorner'];
   return Envelope(lowerCorner: lowerCorner, upperCorner: upperCorner);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lowerCorner'] = lowerCorner;
    data['upperCorner'] = upperCorner;
    return data;
  }
}
