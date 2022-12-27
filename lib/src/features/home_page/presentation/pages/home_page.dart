import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/presentation/bloc_manager/home_bloc.dart';

class HomePage extends StatelessWidget {
late  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeInitial) {
            homeBloc.add(AddMorePokemons(10));
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WithPokemonsState) {
            return Column(
              children: [
                for(Pokemon a in state.pokemons)...[
                  Text(a.name)
                ]
              ],
            );

          }
          return const Center();
        },
    );


  }
}
