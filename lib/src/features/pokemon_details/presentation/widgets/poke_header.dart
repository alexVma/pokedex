import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/home_page/presentation/widgets/pokemon_card.dart';

import '../../../../theme/pokedex_colors.dart';
import 'curve_painter.dart';

class PokeHeader extends StatelessWidget {
  final Pokemon pokemon;

  const PokeHeader(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurvePainter(PokedexColors.getByName(pokemon.types[0])),
          child: Container(
            color: PokedexColors.getByName(pokemon.types[0]),
            height: 200,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    PokemonCard.formatNumber(pokemon.id),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          height: 250,
          alignment: Alignment.center,
          child: Image(
            image: NetworkImage(pokemon.imageUrl),
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
