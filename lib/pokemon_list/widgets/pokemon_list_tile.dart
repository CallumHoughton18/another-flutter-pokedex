import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_type_pill.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/ui_converters.dart';

import '../../configurations/colors.dart';

class PokemonListTile extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const PokemonListTile(this.pokemonWithDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: key,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            color: UIConverters.PokemonTypeToColor(
                pokemonWithDetails.details.types[0]),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -20,
                right: -20,
                child: Image.network(
                  pokemonWithDetails.pokemon.spriteUrl,
                  fit: BoxFit.fitHeight,
                  width: 100,
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pokemonWithDetails.pokemon.name.capitalize(),
                        style: const TextStyle(
                            fontSize: 24,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteGrey)),
                    const SizedBox(height: 8),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemonWithDetails.details.types
                            .map((e) => Column(
                                  children: [
                                    PokemonTypePill(e),
                                    const SizedBox(height: 7)
                                  ],
                                ))
                            .toList())
                  ]),
            ],
          ),
        ));
  }
}
