import 'package:flutter/material.dart';
import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/pokemon_details/widgets/details_label.dart';
import 'package:pokedex/pokemon_details/widgets/large_pokemon_tile.dart';
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
              enableDrag: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
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
                    "${(pokemonWithDetails.details.height / 10)} m",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 1.5,
              color: AppColors.offWhite,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const DetailsLabel('Weight'),
                  const SizedBox(height: 11),
                  Text("${pokemonWithDetails.details.weight / 10} kg",
                      style: const TextStyle(
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
        StatBar(
          label: "Base XP",
          value: pokemonWithDetails.details.experience,
          maxValue: 500,
          progressBarColor: AppColors.lightYellow,
          labelFlex: 2,
          valueFlex: 1,
          progressBarFlex: 5,
        ),
        SizedBox(height: 20),
        Container(width: 300, child: _buildPokemonWeightAndHeightCard(context)),
        SizedBox(height: 20),
        Row(
          children: [
            Text("Base Stats",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
          ],
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pokemonWithDetails.details.stats.map((stat) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: StatBar(
                label: UIConverters.capitalizePokemonLabel(stat.statName),
                value: stat.baseStat,
                maxValue: 110,
                progressBarColor: UIConverters.baseStatToColor(stat.baseStat),
                labelFlex: 3,
                valueFlex: 1,
                progressBarFlex: 4,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class StatBar extends StatelessWidget {
  const StatBar(
      {Key? key,
      required this.label,
      required this.value,
      required this.maxValue,
      required this.progressBarColor,
      required this.labelFlex,
      required this.valueFlex,
      required this.progressBarFlex})
      : super(key: key);

  final String label;
  final int value;
  final int maxValue;
  final Color progressBarColor;
  final int labelFlex;
  final int valueFlex;
  final int progressBarFlex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: labelFlex,
          child: Text(label,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey)),
        ),
        Expanded(
          flex: valueFlex,
          child: Text(value.toString(),
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey)),
        ),
        Expanded(
          flex: progressBarFlex,
          child: LinearProgressIndicator(
            value: ExtendedMath.normalize(
                value.toDouble(), 0, maxValue.toDouble()),
            backgroundColor: AppColors.offWhite,
            valueColor: AlwaysStoppedAnimation(progressBarColor),
          ),
        ),
      ],
    );
  }
}
