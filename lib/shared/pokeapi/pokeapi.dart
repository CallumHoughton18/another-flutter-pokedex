import 'package:pokedex/shared/pokeapi/models/details.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';

abstract class PokeApi {
  Future<List<Pokemon>> getPokemonAsList(int offset, int limit);
  Future<PokemonDetails> getPokemonDetails(int index);
  Future<List<PokemonWithDetails>> getPokemonWithDetails(int offset, int limit);
}
