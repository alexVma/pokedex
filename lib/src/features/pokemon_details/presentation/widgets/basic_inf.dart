import 'package:flutter/material.dart';
import 'package:pokedex/src/theme/pokedex_colors.dart';

import '../../../home_page/domain/entities/pokemon.dart';
import 'animated_counter.dart';

class BasicInf extends StatelessWidget {
  final Pokemon pokemon;
  const BasicInf(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    VerticalDivider div = VerticalDivider(
      color: PokedexColors.getByName(pokemon.types[0]),
      thickness: 4,
    );

    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: IntrinsicHeight(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          columnValueText('Base\nExperience', pokemon.baseExperience),
          div,
          columnValueText('Height', pokemon.height),
          div,
          columnValueText('Weight', pokemon.weight),
        ],
      )),
    );
  }

  Widget columnValueText(String description, int value) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        children: [
          AnimatedCounter(
              value: value,
              primaryColor: PokedexColors.getByName(pokemon.types[0])),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
