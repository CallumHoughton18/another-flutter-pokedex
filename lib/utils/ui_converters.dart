import 'dart:ui';

import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/shared/pokeapi/models/details.dart';

class UIConverters {
  static Color PokemonTypeToColor(PokemonTypes type) {
    switch (type) {
      case PokemonTypes.normal:
        return AppColors.normalGrey;
      case PokemonTypes.fire:
        return AppColors.lightRed;
      case PokemonTypes.water:
        return AppColors.blue;
      case PokemonTypes.electric:
        return AppColors.yellow;
      case PokemonTypes.grass:
        return AppColors.lightGreen;
      case PokemonTypes.ice:
        return AppColors.lightTeal;
      case PokemonTypes.fighting:
        return AppColors.darkRed;
      case PokemonTypes.poison:
        return AppColors.purple;
      case PokemonTypes.ground:
        return AppColors.brown;
      case PokemonTypes.flying:
        return AppColors.lightBlue;
      case PokemonTypes.psychic:
        return AppColors.lightRed;
      case PokemonTypes.bug:
        return AppColors.lightGreen;
      case PokemonTypes.rock:
        return AppColors.beige;
      case PokemonTypes.ghost:
        return AppColors.ghostBlue;
      case PokemonTypes.dragon:
        return AppColors.dragonBlue;
      case PokemonTypes.dark:
      case PokemonTypes.steel:
        return AppColors.blueGrey;
      case PokemonTypes.fairy:
        return AppColors.lightPink;
    }
  }

  static String PokemonTypeToSvgPath(PokemonTypes type) {
    return "assets/pokemon_type_svgs/${type.toShortString()}.svg";
  }
}
