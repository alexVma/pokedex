import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/presentation/widgets/my_custom_scroll_behavior.dart';

import '../bloc_manager/home_bloc.dart';

/// The HomePaginator widget is responsible for displaying a list of Pokemon on the homepage.
/// It uses an infinite scroll feature to allow the user to load more Pokemon as they scroll through the list.
class HomePaginator extends StatefulWidget {
  const HomePaginator({super.key});

  @override
  State<HomePaginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<HomePaginator> {
  /// A reference to the HomeBloc, which is used to fetch and manage the list of Pokemon
  late HomeBloc pokeBloc;

  /// A flag to control when more Pokemon should be fetched
  bool scrollSwitch = true;

  /// The current offset in the list of Pokemon
  int countPokemon = 0;

  /// The list of all Pokemon that have been fetched so far
  List<Pokemon> allPokemonList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    allPokemonList = [];
  }

  @override
  Widget build(BuildContext context) {
    /// Get a reference to the HomeBloc from the context
    pokeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: pokeBloc,
      builder: (context, state) {
        /// If the state is HomeInitial, show a loading spinner while waiting for Pokemon to be fetched
        if (state is HomeInitial) {
          /// Send an event to the HomeBloc to fetch the next batch of Pokemon
          pokeBloc.add(AddMorePokemons(countPokemon));
          return const Center(child: CircularProgressIndicator());
        }

        /// If the state is WithPokemonsState, display the list of Pokemon
        if (state is WithPokemonsState) {
          scrollSwitch = true;
          return pokemonsPage(state);
        }
        return const Center();
      },
    );
  }

  /// Returns a widget that displays the list of Pokemon
  Widget pokemonsPage(WithPokemonsState state) {
    /// Add the new Pokemon to the list of all Pokemon
    allPokemonList.addAll(state.pokemons);

    /// Create a scroll controller to enable infinite scrolling
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      /// When the user has scrolled to within 200 pixels of the end of the list, fetch more Pokemon
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
