import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/pokemon_details/widgets/large_pokemon_tile.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_list_tile.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';

import '../utils/ui_converters.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const PokemonDetailsScreen(this.pokemonWithDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          UIConverters.PokemonTypeToColor(pokemonWithDetails.details.types[0]),
      child: Column(children: [
        AnimatedOpacity(
            opacity: 1,
            duration: const Duration(seconds: 3),
            child: LargePokemonTile(pokemonWithDetails)),
        // Hero(
        //   tag: pokemonWithDetails.pokemon.spriteUrl,
        //   child: Image.network(
        //     pokemonWithDetails.pokemon.spriteUrl,
        //     fit: BoxFit.fitHeight,
        //     width: 300,
        //   ),
        // ),
        Expanded(
          child: BottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
              onClosing: () => {},
              builder: ((context) {
                return Center(child: Text("Test"));
              })),
        )
      ]),
    );
  }
}
