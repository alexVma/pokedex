import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/presentation/widgets/my_custom_scroll_behavior.dart';

import '../bloc_manager/home_bloc.dart';

class HomePaginator extends StatefulWidget {
  const HomePaginator({super.key});

  @override
  State<HomePaginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<HomePaginator> {
  late HomeBloc pokeBloc;
  bool scrollSwitch = true;
  int countPokemon = 0;
  List<Pokemon> allPokemonList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pokeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: pokeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          pokeBloc.add(AddMorePokemons(countPokemon));
          return const Center(child: CircularProgressIndicator());
        }

        if (state is WithPokemonsState) {
          scrollSwitch = true;
          return pokemonsPage(state);
        }
        return const Center();
      },
    );
  }

  Widget pokemonsPage(WithPokemonsState state) {
    allPokemonList.addAll(state.pokemons);

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch == true) {
        scrollSwitch = false;
        countPokemon += 10;
        pokeBloc.add(AddMorePokemons(countPokemon));
      }
    });

    return ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: GridView.count(
          shrinkWrap: true,
          controller: scrollController,
          childAspectRatio: (1 / 1.4),
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: allPokemonList.map((entry) {
            return Text('${entry.id}');
          }).toList(),
          // ),
        ));
  }
}
