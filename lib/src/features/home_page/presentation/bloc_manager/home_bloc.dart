import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/domain/use_cases/add_pokemons.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddPokemons addPokemonsUseCase;
  HomeBloc({required this.addPokemonsUseCase}) : super(HomeInitial()) {
    on<AddMorePokemons>(_onAddMorePokemons);
  }

  void _onAddMorePokemons(
      AddMorePokemons event, Emitter<HomeState> emit) async {
    /*   await Future.delayed(Duration(seconds: 1));
    final List<String> pokemons = [
      'a',
      'b'
    ];
*/
    // await this.pokemonRepository.fetchPokemons();
    final response = await addPokemonsUseCase.addPokemons(event.offset);
    response.fold((fail) {
      emit(HomeInitial());
    }, (data) {
      emit(WithPokemonsState(pokemons: data, amount: data.length));
    });

    //  emit(WithPokemonsState(pokemons: pokemons, amount: pokemons.length));
  }

  @override
  HomeState get initialState => HomeInitial();
}
