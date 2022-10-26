import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_details/widgets/large_pokemon_tile.dart';
import 'package:pokedex/pokemon_details/widgets/pokemon_stat_details.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import '../utils/ui_converters.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;

  const PokemonDetailsScreen(this.pokemonWithDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          UIConverters.pokemonTypeToColor(pokemonWithDetails.details.types[0]),
      child: Column(children: [
        LargePokemonTile(pokemonWithDetails),
        Expanded(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  clipBehavior: Clip.none,
                  controller: scrollController,
                  child: BottomSheet(
                      enableDrag: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      onClosing: () => {},
                      builder: ((context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: PokemonStatDetails(
                            pokemonWithDetails: pokemonWithDetails,
                          ),
                        );
                      })));
            },
          ),
        )
      ]),
    );
  }
}
