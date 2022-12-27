import 'package:pokedex/generated/json/base/json_field.dart';
import 'package:pokedex/generated/json/pokemon_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PokemonModelEntity {
  late int id;
  late String name;
  late List<PokemonModelTypes> types;

  PokemonModelEntity();

  factory PokemonModelEntity.fromJson(Map<String, dynamic> json) =>
      $PokemonModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelTypes {
  late int slot;
  late PokemonModelTypesType type;

  PokemonModelTypes();

  factory PokemonModelTypes.fromJson(Map<String, dynamic> json) =>
      $PokemonModelTypesFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelTypesType {
  late String name;
  late String url;

  PokemonModelTypesType();

  factory PokemonModelTypesType.fromJson(Map<String, dynamic> json) =>
      $PokemonModelTypesTypeFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelTypesTypeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
