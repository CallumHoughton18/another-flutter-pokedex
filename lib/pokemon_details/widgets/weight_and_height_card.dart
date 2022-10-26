import 'package:flutter/material.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import '../../configurations/colors.dart';
import 'details_label.dart';

class WeightAndHeightCard extends StatelessWidget {
  final PokemonWithDetails pokemonWithDetails;
  const WeightAndHeightCard({
    Key? key,
    required this.pokemonWithDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 8),
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
                  const DetailsLabel('Height'),
                  const SizedBox(height: 11),
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
}
