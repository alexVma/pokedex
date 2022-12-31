import 'package:flutter/material.dart';

import '../../../../theme/pokedex_colors.dart';
import '../../../home_page/domain/entities/pokemon.dart';
import 'animated_progress_indicator.dart';

class InfoStats extends StatelessWidget {
  final Pokemon pokemon;

  const InfoStats(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    ///The value of maxValue is calculated using the reduce method and an anonymous function.
    ///The reduce method is a higher-order function that takes a list (in this case, pokemon.stats) and applies a function to each element in the list
    ///in order to reduce it to a single value. The anonymous function compares the baseValue property of two elements in the list (a and b) and returns the element with the higher baseValue.
    double maxValue = pokemon.stats
            .reduce((a, b) => a.baseValue > b.baseValue ? a : b)
            .baseValue *
        1.0;

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Base Stats',
          style: TextStyle(
              color: PokedexColors.getByName(pokemon.types[0])[800],
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      ...pokemon.stats.map((e) {
        return Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: AnimatedLinearProgressIndicator(
              percentage: e.baseValue * 1.0,
              label: e.name,
              maxValue: maxValue,
              mainColor: PokedexColors.getByName(pokemon.types[0]),
            ));
      }).toList()
    ]);
  }
}
