import 'package:http/http.dart' as http;
import 'package:pokedex/src/core/errors/exceptions.dart';
import 'dart:convert';

import 'package:pokedex/src/features/home_page/data/data_sources/data_source.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_paginator_entity.dart';

class RemoteDataSource implements DataSource {

 // final http.Client client;
 String url;
  RemoteDataSource(/*this.client*/this.url);

  @override
  Future<List<PokemonPaginatorResults>> getMorePokemons(int offset) async {
    http.Response response = await http.get(
        Uri.parse( '$url/pokemon/?offset=$offset&limit=10')
    );

    if (response.statusCode == 200) {
      PokemonPaginatorEntity ppe=PokemonPaginatorEntity.fromJson(jsonDecode(response.body));
      return ppe.results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModelEntity> getPokemonByName(String name) async {
    final result =
        await http.get(Uri.parse('$url/pokemon/$name'));
    if (result.statusCode == 200) {
      return PokemonModelEntity.fromJson(jsonDecode(result.body));
    } else {
      throw ServerException();
    }
  }
}