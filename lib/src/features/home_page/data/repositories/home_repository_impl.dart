import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/errors/failures.dart';
import 'package:pokedex/src/features/home_page/data/data_sources/remote_data_source.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_model_entity.dart';
import 'package:pokedex/src/features/home_page/data/models/pokemon_paginator_entity.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> addPokemons(int offset) async {
    try {
      List<PokemonPaginatorResults> pageResult =
          await remoteDataSource.getMorePokemons(offset);
      List<Pokemon> result = [];

      for (PokemonPaginatorResults e in pageResult) {
        PokemonModelEntity pme =
            await remoteDataSource.getPokemonByName(e.name);
        List<String> types = [];
        for (PokemonModelTypes f in pme.types) {
          types.add(f.type.name);
        }

        List<Stats> stats = [];
        for (PokemonModelStats pms in pme.stats) {
          stats.add(Stats(name: pms.stat.name, baseValue: pms.baseStat));
        }

        result.add(Pokemon(
            id: pme.id,
            name: pme.name,
            types: types,
            height: pme.height,
            weight: pme.weight,
            baseExperience: pme.baseExperience,
            stats: stats,
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pme.id}.png'));
      }
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
