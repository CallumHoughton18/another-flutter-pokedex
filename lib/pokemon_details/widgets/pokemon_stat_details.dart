import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_details/widgets/stat_bar.dart';
import 'package:pokedex/pokemon_details/widgets/weight_and_height_card.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import '../../configurations/colors.dart';
import '../../utils/ui_converters.dart';

class PokemonStatDetails extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const PokemonStatDetails({
    Key? key,
    required this.pokemonWithDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedId =
        pokemonWithDetails.pokemon.id.toString().padLeft(3, '0');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("#$formattedId",
            style: const TextStyle(
                fontSize: 30,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w700,
                color: AppColors.normalGrey)),
        const SizedBox(height: 30),
        StatBar(
          label: "Base XP",
          value: pokemonWithDetails.details.experience,
          maxValue: 500,
          progressBarColor: AppColors.lightYellow,
          labelFlex: 2,
          valueFlex: 1,
          progressBarFlex: 5,
        ),
        const SizedBox(height: 20),
        SizedBox(
            width: 300,
            child: WeightAndHeightCard(pokemonWithDetails: pokemonWithDetails)),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text("Base Stats",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pokemonWithDetails.details.stats.map((stat) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
