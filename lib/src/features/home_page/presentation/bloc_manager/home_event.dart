part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddMorePokemons extends HomeEvent {
  final int offset;

  const AddMorePokemons(this.offset);

  @override
  List<Object> get props => [offset];
}

class ResetList extends HomeEvent {
  const ResetList();

  @override
  List<Object> get props => [];
}
