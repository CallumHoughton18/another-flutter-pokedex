import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/utils/extensions.dart';

import '../../configurations/colors.dart';
import '../../shared/pokeapi/models/details.dart';
import '../../shared/widgets/content_pill.dart';
import '../../utils/ui_converters.dart';

class PokemonTypePill extends StatelessWidget {
  final PokemonTypes type;
  const PokemonTypePill(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentPill(
      Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: UIConverters.PokemonTypeToColor(type)),
              child: SvgPicture.asset(
                UIConverters.PokemonTypeToSvgPath(type),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              type.toShortString().capitalize(),
              textScaleFactor: 1,
              style: const TextStyle(
                  color: AppColors.whiteGrey, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ]),
      backgroundColor: AppColors.whiteGrey.withOpacity(0.2),
    );
  }
}
