import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_paginator_entity.dart';

abstract class DataSource {
  Future<List<PokemonPaginatorResults>> getMorePokemons(int offset);
  Future<PokemonModelEntity> getPokemonByName(String name);
}
