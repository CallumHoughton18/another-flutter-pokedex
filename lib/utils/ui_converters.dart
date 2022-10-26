import 'dart:ui';

import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/shared/pokeapi/models/details.dart';
import 'package:pokedex/utils/extensions.dart';

class UIConverters {
  static Color pokemonTypeToColor(PokemonTypes type) {
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
        return AppColors.deepRed;
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

  static String pokemonTypeToSvgPath(PokemonTypes type) {
    return "assets/pokemon_type_svgs/${type.toShortString()}.svg";
  }

  static String capitalizePokemonLabel(String value) {
    if (value.length < 3) {
      return value.toUpperCase();
    }
    return value.split(RegExp('[ -]')).map((str) => str.capitalize()).join(' ');
  }

  static Color baseStatToColor(int baseStat) {
    if (baseStat < 50) {
      return AppColors.red;
    } else if (baseStat < 70) {
      return AppColors.orange;
    } else {
      return AppColors.lightGreen;
    }
  }
}
