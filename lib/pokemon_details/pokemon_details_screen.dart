import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/pokemon_details/widgets/details_label.dart';
import 'package:pokedex/pokemon_details/widgets/large_pokemon_tile.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_list_tile.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'package:pokedex/utils/extended_math.dart';

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
        LargePokemonTile(pokemonWithDetails),
        Expanded(
          child: BottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
              onClosing: () => {},
              builder: ((context) {
                return Container(
                    constraints: BoxConstraints.expand(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _builPokemonInfo(context),
                    ));
              })),
        )
      ]),
    );
  }

  Widget _buildPokemonWeightAndHeightCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DetailsLabel('Height'),
                  SizedBox(height: 11),
                  Text(
                    pokemonWithDetails.details.height.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            VerticalDivider(
              thickness: 1.5,
              color: AppColors.offWhite,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DetailsLabel('Weight'),
                  SizedBox(height: 11),
                  Text(pokemonWithDetails.details.weight.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builPokemonInfo(BuildContext context) {
    String formattedId =
        pokemonWithDetails.pokemon.id.toString().padLeft(3, '0');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("#${formattedId}",
            style: const TextStyle(
                fontSize: 30,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w700,
                color: AppColors.normalGrey)),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Base XP",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey)),
            SizedBox(width: 20),
            Text(pokemonWithDetails.details.experience.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkGrey)),
            SizedBox(width: 20),
            Expanded(
              child: LinearProgressIndicator(
                value: ExtendedMath.normalize(
                    pokemonWithDetails.details.experience.toDouble(), 0, 500),
                backgroundColor: AppColors.offWhite,
                valueColor: AlwaysStoppedAnimation(AppColors.lightYellow),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(width: 300, child: _buildPokemonWeightAndHeightCard(context))
      ],
    );
  }
}
