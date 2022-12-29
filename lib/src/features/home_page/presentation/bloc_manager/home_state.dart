part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final List<Pokemon> pokemons = [];

  HomeInitial();

  @override
  List<Object> get props => [pokemons];
}

class WithPokemonsState extends HomeState {
  final List<Pokemon> pokemons;
  final int amount;

  const WithPokemonsState({required this.pokemons, required this.amount});

  @override
  List<Object> get props => [pokemons, amount];
}

class ResetState extends HomeState {
  const ResetState();
  @override
  List<Object> get props => [];
}
