import 'package:pokedex/generated/json/base/json_field.dart';
import 'package:pokedex/generated/json/pokemon_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PokemonModelEntity {
  @JSONField(name: "base_experience")
  late int baseExperience;
  late int height;
  late int id;
  late String name;
  late int weight;
  late List<PokemonModelTypes> types;
  late List<PokemonModelStats> stats;

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

@JsonSerializable()
class PokemonModelStats {
  @JSONField(name: "base_stat")
  late int baseStat;
  late int effort;
  late PokemonModelStatsStat stat;

  PokemonModelStats();

  factory PokemonModelStats.fromJson(Map<String, dynamic> json) =>
      $PokemonModelStatsFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelStatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelStatsStat {
  late String name;
  late String url;

  PokemonModelStatsStat();

  factory PokemonModelStatsStat.fromJson(Map<String, dynamic> json) =>
      $PokemonModelStatsStatFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelStatsStatToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
