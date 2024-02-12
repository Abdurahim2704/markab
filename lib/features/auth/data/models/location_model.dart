import 'package:meta/meta.dart';
import 'dart:convert';

class LocationModel {
  Response response;

  LocationModel({
    required this.response,
  });

  factory LocationModel.fromRawJson(String str) => LocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class Response {
  GeoObjectCollection geoObjectCollection;

  Response({
    required this.geoObjectCollection,
  });

  factory Response.fromRawJson(String str) => Response.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    geoObjectCollection: GeoObjectCollection.fromJson(json["GeoObjectCollection"]),
  );

  Map<String, dynamic> toJson() => {
    "GeoObjectCollection": geoObjectCollection.toJson(),
  };
}

class GeoObjectCollection {
  GeoObjectCollectionMetaDataProperty metaDataProperty;
  List<FeatureMember> featureMember;

  GeoObjectCollection({
    required this.metaDataProperty,
    required this.featureMember,
  });

  factory GeoObjectCollection.fromRawJson(String str) => GeoObjectCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoObjectCollection.fromJson(Map<String, dynamic> json) => GeoObjectCollection(
    metaDataProperty: GeoObjectCollectionMetaDataProperty.fromJson(json["metaDataProperty"]),
    featureMember: List<FeatureMember>.from(json["featureMember"].map((x) => FeatureMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "metaDataProperty": metaDataProperty.toJson(),
    "featureMember": List<dynamic>.from(featureMember.map((x) => x.toJson())),
  };
}

class FeatureMember {
  GeoObject geoObject;

  FeatureMember({
    required this.geoObject,
  });

  factory FeatureMember.fromRawJson(String str) => FeatureMember.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureMember.fromJson(Map<String, dynamic> json) => FeatureMember(
    geoObject: GeoObject.fromJson(json["GeoObject"]),
  );

  Map<String, dynamic> toJson() => {
    "GeoObject": geoObject.toJson(),
  };
}

class GeoObject {
  GeoObjectMetaDataProperty metaDataProperty;
  String name;
  String? description;
  BoundedBy boundedBy;
  String uri;
  Point point;

  GeoObject({
    required this.metaDataProperty,
    required this.name,
    required this.description,
    required this.boundedBy,
    required this.uri,
    required this.point,
  });

  factory GeoObject.fromRawJson(String str) => GeoObject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoObject.fromJson(Map<String, dynamic> json) => GeoObject(
    metaDataProperty: GeoObjectMetaDataProperty.fromJson(json["metaDataProperty"]),
    name: json["name"],
    description: json["description"],
    boundedBy: BoundedBy.fromJson(json["boundedBy"]),
    uri: json["uri"],
    point: Point.fromJson(json["Point"]),
  );

  Map<String, dynamic> toJson() => {
    "metaDataProperty": metaDataProperty.toJson(),
    "name": name,
    "description": description,
    "boundedBy": boundedBy.toJson(),
    "uri": uri,
    "Point": point.toJson(),
  };
}

class BoundedBy {
  Envelope envelope;

  BoundedBy({
    required this.envelope,
  });

  factory BoundedBy.fromRawJson(String str) => BoundedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoundedBy.fromJson(Map<String, dynamic> json) => BoundedBy(
    envelope: Envelope.fromJson(json["Envelope"]),
  );

  Map<String, dynamic> toJson() => {
    "Envelope": envelope.toJson(),
  };
}

class Envelope {
  String lowerCorner;
  String upperCorner;

  Envelope({
    required this.lowerCorner,
    required this.upperCorner,
  });

  factory Envelope.fromRawJson(String str) => Envelope.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Envelope.fromJson(Map<String, dynamic> json) => Envelope(
    lowerCorner: json["lowerCorner"],
    upperCorner: json["upperCorner"],
  );

  Map<String, dynamic> toJson() => {
    "lowerCorner": lowerCorner,
    "upperCorner": upperCorner,
  };
}

class GeoObjectMetaDataProperty {
  GeocoderMetaData geocoderMetaData;

  GeoObjectMetaDataProperty({
    required this.geocoderMetaData,
  });

  factory GeoObjectMetaDataProperty.fromRawJson(String str) => GeoObjectMetaDataProperty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoObjectMetaDataProperty.fromJson(Map<String, dynamic> json) => GeoObjectMetaDataProperty(
    geocoderMetaData: GeocoderMetaData.fromJson(json["GeocoderMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "GeocoderMetaData": geocoderMetaData.toJson(),
  };
}

class GeocoderMetaData {
  String precision;
  String text;
  String kind;
  Address address;
  AddressDetails addressDetails;

  GeocoderMetaData({
    required this.precision,
    required this.text,
    required this.kind,
    required this.address,
    required this.addressDetails,
  });

  factory GeocoderMetaData.fromRawJson(String str) => GeocoderMetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) => GeocoderMetaData(
    precision: json["precision"],
    text: json["text"],
    kind: json["kind"],
    address: Address.fromJson(json["Address"]),
    addressDetails: AddressDetails.fromJson(json["AddressDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "precision": precision,
    "text": text,
    "kind": kind,
    "Address": address.toJson(),
    "AddressDetails": addressDetails.toJson(),
  };
}

class Address {
  String? countryCode;
  String formatted;
  List<Component> components;

  Address({
    required this.countryCode,
    required this.formatted,
    required this.components,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    countryCode: json["country_code"],
    formatted: json["formatted"],
    components: List<Component>.from(json["Components"].map((x) => Component.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country_code": countryCode,
    "formatted": formatted,
    "Components": List<dynamic>.from(components.map((x) => x.toJson())),
  };
}

class Component {
  String kind;
  String name;

  Component({
    required this.kind,
    required this.name,
  });

  factory Component.fromRawJson(String str) => Component.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    kind: json["kind"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "name": name,
  };
}

class AddressDetails {
  Country? country;
  String? address;

  AddressDetails({
    required this.country,
    required this.address,
  });

  factory AddressDetails.fromRawJson(String str) => AddressDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressDetails.fromJson(Map<String, dynamic>? json) => AddressDetails(
    country: Country.fromJson(json?["Country"]),
    address: json?["Address"],
  );

  Map<String, dynamic> toJson() => {
    "Country": country?.toJson(),
    "Address": address,
  };
}

class Country {
  String? addressLine;
  String? countryNameCode;
  String? countryName;
  AdministrativeArea? administrativeArea;

  Country({
    required this.addressLine,
    required this.countryNameCode,
    required this.countryName,
    required this.administrativeArea,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic>? json) => Country(
    addressLine: json?["AddressLine"],
    countryNameCode: json?["CountryNameCode"],
    countryName: json?["CountryName"],
    administrativeArea: AdministrativeArea.fromJson(json?["AdministrativeArea"]),
  );

  Map<String, dynamic> toJson() => {
    "AddressLine": addressLine,
    "CountryNameCode": countryNameCode,
    "CountryName": countryName,
    "AdministrativeArea": administrativeArea?.toJson(),
  };
}

class AdministrativeArea {
  String? administrativeAreaName;
  SubAdministrativeArea? subAdministrativeArea;

  AdministrativeArea({
    required this.administrativeAreaName,
    required this.subAdministrativeArea,
  });

  factory AdministrativeArea.fromRawJson(String str) => AdministrativeArea.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdministrativeArea.fromJson(Map<String, dynamic>? json) => AdministrativeArea(
    administrativeAreaName: json?["AdministrativeAreaName"],
    subAdministrativeArea: SubAdministrativeArea.fromJson(json?["SubAdministrativeArea"]),
  );

  Map<String, dynamic> toJson() => {
    "AdministrativeAreaName": administrativeAreaName,
    "SubAdministrativeArea": subAdministrativeArea?.toJson(),
  };
}

class SubAdministrativeArea {
  String? subAdministrativeAreaName;

  SubAdministrativeArea({
    required this.subAdministrativeAreaName,
  });

  factory SubAdministrativeArea.fromRawJson(String str) => SubAdministrativeArea.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubAdministrativeArea.fromJson(Map<String, dynamic>? json) => SubAdministrativeArea(
    subAdministrativeAreaName: json?["SubAdministrativeAreaName"],
  );

  Map<String, dynamic> toJson() => {
    "SubAdministrativeAreaName": subAdministrativeAreaName,
  };
}

class Point {
  String pos;

  Point({
    required this.pos,
  });

  factory Point.fromRawJson(String str) => Point.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Point.fromJson(Map<String, dynamic> json) => Point(
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "pos": pos,
  };
}

class GeoObjectCollectionMetaDataProperty {
  GeocoderResponseMetaData geocoderResponseMetaData;

  GeoObjectCollectionMetaDataProperty({
    required this.geocoderResponseMetaData,
  });

  factory GeoObjectCollectionMetaDataProperty.fromRawJson(String str) => GeoObjectCollectionMetaDataProperty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeoObjectCollectionMetaDataProperty.fromJson(Map<String, dynamic> json) => GeoObjectCollectionMetaDataProperty(
    geocoderResponseMetaData: GeocoderResponseMetaData.fromJson(json["GeocoderResponseMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "GeocoderResponseMetaData": geocoderResponseMetaData.toJson(),
  };
}

class GeocoderResponseMetaData {
  Point point;
  String request;
  String results;
  String found;

  GeocoderResponseMetaData({
    required this.point,
    required this.request,
    required this.results,
    required this.found,
  });

  factory GeocoderResponseMetaData.fromRawJson(String str) => GeocoderResponseMetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GeocoderResponseMetaData.fromJson(Map<String, dynamic> json) => GeocoderResponseMetaData(
    point: Point.fromJson(json["Point"]),
    request: json["request"],
    results: json["results"],
    found: json["found"],
  );

  Map<String, dynamic> toJson() => {
    "Point": point.toJson(),
    "request": request,
    "results": results,
    "found": found,
  };
}
