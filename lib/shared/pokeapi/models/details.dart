import 'dart:ui';

import 'package:pokedex/configurations/colors.dart';
import 'package:pokedex/shared/pokeapi/models/stats.dart';

enum PokemonTypes {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy
}

extension ParseToString on PokemonTypes {
  String toShortString() {
    return toString().split(".").last;
  }
}

class PokemonDetails {
  final int experience;
  final String spriteUrl;
  final int height;
  final int weight;
  final List<PokemonTypes> types;
  final List<Stat> stats;

  PokemonDetails.fromJson(Map<String, dynamic> json)
      : experience = json['base_experience'],
        spriteUrl = json['sprites']['front_default'],
        height = json['height'],
        weight = json['weight'],
        types = (json['types'] as List)
            .map((type) => PokemonTypes.values.firstWhere(
                (e) => e.toString() == 'PokemonTypes.' + type['type']['name'],
                orElse: () => PokemonTypes.normal))
            .toList(),
        stats = (json['stats'] as List)
            .map((stat) => Stat(
                baseStat: stat['base_stat'],
                effort: stat['effort'],
                statName: stat['stat']['name']))
            .toList();
}
