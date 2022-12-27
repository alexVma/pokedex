import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/errors/failures.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Pokemon>>> addPokemons(int offset);
}
