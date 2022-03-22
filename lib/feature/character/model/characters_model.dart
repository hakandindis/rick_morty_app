import 'package:json_annotation/json_annotation.dart';

part 'characters_model.g.dart';

@JsonSerializable(createToJson: false)
class CharactersModel {
  Info? info;
  List<Results>? results;

  CharactersModel({this.info, this.results});

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return _$CharactersModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return _$InfoFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory Results.fromJson(Map<String, dynamic> json) {
    return _$ResultsFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return _$OriginFromJson(json);
  }
}
