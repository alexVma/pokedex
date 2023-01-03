import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/domain/use_cases/add_pokemons.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddPokemons addPokemonsUseCase;
  HomeBloc({required this.addPokemonsUseCase}) : super(HomeInitial()) {
    on<AddMorePokemons>(_onAddMorePokemons);
    on<ResetList>(_resetState);
  }

  void _resetState(ResetList event, Emitter<HomeState> emit) {
    emit(HomeInitial());
  }

  void _onAddMorePokemons(
      AddMorePokemons event, Emitter<HomeState> emit) async {
    final response = await addPokemonsUseCase.addPokemons(event.offset);
    response.fold((fail) {
      emit(HomeInitial());
    }, (data) {
      emit(WithPokemonsState(pokemons: data, amount: data.length));
    });
  }

  HomeState get initialState => HomeInitial();
}
