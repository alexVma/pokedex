import 'package:pokedex/generated/json/base/json_convert_content.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_paginator_entity.dart';

PokemonPaginatorEntity $PokemonPaginatorEntityFromJson(
    Map<String, dynamic> json) {
  final PokemonPaginatorEntity pokemonPaginatorEntity =
      PokemonPaginatorEntity();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    pokemonPaginatorEntity.count = count;
  }
  final String? next = jsonConvert.convert<String>(json['next']);
  if (next != null) {
    pokemonPaginatorEntity.next = next;
  }
  final String? previous = jsonConvert.convert<String>(json['previous']);
  if (previous != null) {
    pokemonPaginatorEntity.previous = previous;
  }
  final List<PokemonPaginatorResults>? results =
      jsonConvert.convertListNotNull<PokemonPaginatorResults>(json['results']);
  if (results != null) {
    pokemonPaginatorEntity.results = results;
  }
  return pokemonPaginatorEntity;
}

Map<String, dynamic> $PokemonPaginatorEntityToJson(
    PokemonPaginatorEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  data['next'] = entity.next;
  data['previous'] = entity.previous;
  data['results'] = entity.results.map((v) => v.toJson()).toList();
  return data;
}

PokemonPaginatorResults $PokemonPaginatorResultsFromJson(
    Map<String, dynamic> json) {
  final PokemonPaginatorResults pokemonPaginatorResults =
      PokemonPaginatorResults();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonPaginatorResults.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pokemonPaginatorResults.url = url;
  }
  return pokemonPaginatorResults;
}

Map<String, dynamic> $PokemonPaginatorResultsToJson(
    PokemonPaginatorResults entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}
