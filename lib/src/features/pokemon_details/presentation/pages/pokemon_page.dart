import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/pokemon_details/presentation/widgets/info_stats.dart';

import '../../../../theme/pokedex_colors.dart';
import '../widgets/basic_inf.dart';
import '../widgets/poke_header.dart';
import '../widgets/types_widget.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: PokedexColors.getByName(pokemon.types[0]),
            title: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Back',
              ),
            )),
        body: ListView(
          children: [
            PokeHeader(pokemon),
            TypesWidget(pokemon),
            BasicInf(pokemon),
            InfoStats(pokemon)
          ],
        ));
  }
}
