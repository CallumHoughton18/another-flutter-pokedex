import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const PokemonDetailsScreen(this.pokemonWithDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.network(
      pokemonWithDetails.pokemon.spriteUrl,
      fit: BoxFit.fitHeight,
      width: 500,
    ));
  }
}
