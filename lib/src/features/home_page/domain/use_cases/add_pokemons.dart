import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/errors/failures.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/domain/repositories/home_repository.dart';

class AddPokemons {
  final HomeRepository repository;

  AddPokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>> addPokemons(int offset) async {
    return await repository.addPokemons(offset);
  }
}
