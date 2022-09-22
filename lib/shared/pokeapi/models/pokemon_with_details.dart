import 'package:pokedex/shared/pokeapi/models/details.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';

class PokemonWithDetails {
  final Pokemon pokemon;
  final PokemonDetails details;
  const PokemonWithDetails(this.pokemon, this.details);
}
