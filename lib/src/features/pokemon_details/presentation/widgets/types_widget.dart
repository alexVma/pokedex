import 'package:flutter/material.dart';
import 'package:pokedex/src/theme/pokedex_colors.dart';

import '../../../home_page/domain/entities/pokemon.dart';

class TypesWidget extends StatelessWidget {
  final Pokemon pokemon;

  const TypesWidget(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pokemon.types
            .map((e) => Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  width: screenSize.width / pokemon.types.length - 50,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PokedexColors.getByName(e),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: PokedexColors.getByName(e)[900]!, width: 1)),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ))
            .toList());
  }
}
