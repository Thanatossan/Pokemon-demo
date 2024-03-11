import 'package:json_annotation/json_annotation.dart';

part 'PokemonModel.g.dart';

@JsonSerializable()
class PokemonModel {
  final int id;
  final String? name;
  final Sprites? sprites;
  PokemonModel({required this.id, this.name, this.sprites});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  Sprites({this.frontDefault});

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
