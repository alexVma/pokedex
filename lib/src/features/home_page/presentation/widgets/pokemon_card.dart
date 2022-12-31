import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home_page/domain/entities/pokemon.dart';
import 'package:pokedex/src/features/pokemon_details/presentation/pages/pokemon_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../theme/pokedex_colors.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor mainColor = PokedexColors.getByName(pokemon.types[0]);
    double borderWidth = 0;
    double pokeNumFontSize = 20;
    double pokeNameFontSize = 20;

    switch (getDeviceType(MediaQuery.of(context).size)) {
      case DeviceScreenType.mobile:
        borderWidth = 3;
        pokeNumFontSize = 16;
        pokeNameFontSize = 18;
        break;
      case DeviceScreenType.tablet:
        borderWidth = 6;
        pokeNumFontSize = 18;
        pokeNameFontSize = 20;
        break;
      case DeviceScreenType.desktop:
        borderWidth = 9;
        pokeNumFontSize = 20;
        pokeNameFontSize = 22;
        break;
      default:
        borderWidth = 3;
        pokeNumFontSize = 16;
        pokeNameFontSize = 18;
        break;
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: mainColor[800]!, width: borderWidth)),
      color: mainColor,
      child: InkWell(
        child: Container(
            height: double.maxFinite,
            padding: const EdgeInsets.only(right: 5, top: 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 5, right: 5),
                  child: Text(
                    formatNumber(pokemon.id),
                    style: TextStyle(
                        fontSize: pokeNumFontSize, color: mainColor[200]),
                  ),
                ),
                Text(
                  pokemon.name.toUpperCase(),
                  style: TextStyle(
                      fontSize: pokeNameFontSize, color: Colors.white),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 7, right: 5),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: pokemon.types.map((e) {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              padding: const EdgeInsets.only(
                                  top: 3, bottom: 3, left: 6, right: 6),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: PokedexColors.getByName(e)[900],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: PokedexColors.getByName(e)[300]!,
                                      width: 1)),
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: pokeNumFontSize - 2,
                                    color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                        // ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: NetworkImage(pokemon.imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PokemonPage(pokemon),
            ),
          );
        },
      ),
    );
  }

  static String formatNumber(int number) {
    return '#${number.toString().padLeft(3, '0')}';
  }
}
