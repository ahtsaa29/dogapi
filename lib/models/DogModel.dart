// To parse this JSON data, do
//
//     final dogModel = dogModelFromJson(jsonString);

import 'dart:convert';

List<DogModel> dogModelFromJson(String str) =>
    List<DogModel>.from(json.decode(str).map((x) => DogModel.fromJson(x)));

String dogModelToJson(List<DogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogModel {
  DogModel({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
    required this.image,
    required this.countryCode,
    required this.description,
    required this.history,
  });

  Eight weight;
  Eight height;
  int? id;
  String? name;
  String? bredFor;
  BreedGroup? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
  Image image;
  CountryCode? countryCode;
  String? description;
  String? history;

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"] == null
            ? null
            : breedGroupValues.map[json["breed_group"]],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        origin: json["origin"],
        referenceImageId: json["reference_image_id"],
        image: Image.fromJson(json["image"]),
        countryCode: json["country_code"] == null
            ? null
            : countryCodeValues.map[json["country_code"]],
        description: json["description"],
        history: json["history"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "height": height.toJson(),
        "id": id,
        "name": name,
        "bred_for": bredFor,
        "breed_group":
            breedGroup == null ? null : breedGroupValues.reverse[breedGroup],
        "life_span": lifeSpan,
        "temperament": temperament,
        "origin": origin,
        "reference_image_id": referenceImageId,
        "image": image.toJson(),
        "country_code":
            countryCode == null ? null : countryCodeValues.reverse[countryCode],
        "description": description,
        "history": history,
      };
}

enum BreedGroup {
  TOY,
  HOUND,
  TERRIER,
  WORKING,
  MIXED,
  EMPTY,
  NON_SPORTING,
  SPORTING,
  HERDING
}

final breedGroupValues = EnumValues({
  "": BreedGroup.EMPTY,
  "Herding": BreedGroup.HERDING,
  "Hound": BreedGroup.HOUND,
  "Mixed": BreedGroup.MIXED,
  "Non-Sporting": BreedGroup.NON_SPORTING,
  "Sporting": BreedGroup.SPORTING,
  "Terrier": BreedGroup.TERRIER,
  "Toy": BreedGroup.TOY,
  "Working": BreedGroup.WORKING
});

enum CountryCode { AG, US, AU }

final countryCodeValues = EnumValues(
    {"AG": CountryCode.AG, "AU": CountryCode.AU, "US": CountryCode.US});

class Eight {
  Eight({
    required this.imperial,
    required this.metric,
  });

  String imperial;
  String metric;

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}

class Image {
  Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  String id;
  int width;
  int height;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
