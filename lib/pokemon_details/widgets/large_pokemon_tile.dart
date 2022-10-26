import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_type_pill.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/ui_converters.dart';
import 'dart:math' as math;

import '../../configurations/colors.dart';

class LargePokemonTile extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const LargePokemonTile(this.pokemonWithDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      clipBehavior: Clip.none,
      height: 300,
      decoration: BoxDecoration(
          color: UIConverters.pokemonTypeToColor(
              pokemonWithDetails.details.types[0])),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -140,
                bottom: -180,
                child: Transform.rotate(
                  angle: -math.pi / 4,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      "assets/pokeball.svg",
                      color: Colors.white,
                      width: 330,
                    ),
                  ),
                )),
            Positioned(
              bottom: -40,
              right: -40,
              child: Hero(
                tag: pokemonWithDetails.pokemon.spriteUrl,
                child: Image.network(
                  pokemonWithDetails.pokemon.spriteUrl,
                  fit: BoxFit.fitHeight,
                  width: 280,
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemonWithDetails.pokemon.name.capitalize(),
                      style: const TextStyle(
                          fontSize: 42,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteGrey)),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemonWithDetails.details.types
                          .map((e) => Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: PokemonTypePill(e)),
                                ],
                              ))
                          .toList())
                ]),
          ],
        ),
      ),
    );
  }
}
