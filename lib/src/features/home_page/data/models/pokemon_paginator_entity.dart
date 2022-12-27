import 'package:pokedex/generated/json/base/json_field.dart';
import 'package:pokedex/generated/json/pokemon_paginator_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PokemonPaginatorEntity {
  late int count;
  late String next;
  late String previous;
  late List<PokemonPaginatorResults> results;

  PokemonPaginatorEntity();

  factory PokemonPaginatorEntity.fromJson(Map<String, dynamic> json) =>
      $PokemonPaginatorEntityFromJson(json);

  Map<String, dynamic> toJson() => $PokemonPaginatorEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonPaginatorResults {
  late String name;
  late String url;

  PokemonPaginatorResults();

  factory PokemonPaginatorResults.fromJson(Map<String, dynamic> json) =>
      $PokemonPaginatorResultsFromJson(json);

  Map<String, dynamic> toJson() => $PokemonPaginatorResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
