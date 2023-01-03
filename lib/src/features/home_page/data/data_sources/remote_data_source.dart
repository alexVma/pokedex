import 'package:http/http.dart' as http;
import 'package:pokedex/src/core/errors/exceptions.dart';
import 'dart:convert';

import 'package:pokedex/src/features/home_page/data/data_sources/data_source.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_paginator_entity.dart';

class RemoteDataSource implements DataSource {
  final http.Client client;
  RemoteDataSource(this.client);

  @override
  Future<List<PokemonPaginatorResults>> getMorePokemons(int offset) async {
    http.Response response = await client.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=10'));
    if (response.statusCode == 200) {
      PokemonPaginatorEntity ppe =
          PokemonPaginatorEntity.fromJson(jsonDecode(response.body));
      return ppe.results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModelEntity> getPokemonByName(String name) async {
    final result =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (result.statusCode == 200) {
      return PokemonModelEntity.fromJson(jsonDecode(result.body));
    } else {
      throw ServerException();
    }
  }
}
