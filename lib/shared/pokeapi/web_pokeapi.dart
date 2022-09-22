import 'dart:io';

import 'package:pokedex/shared/pokeapi/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'dart:convert' as convert;

import 'package:pokedex/shared/pokeapi/pokeapi.dart';

import 'models/details.dart';

class WebPokeApi implements PokeApi {
  @override
  Future<List<Pokemon>> getPokemonAsList(int offset, int limit) async {
    var queryParams = {'limit': '$limit', 'offset': '$offset'};
    var resJson =
        await getJsonStringFromPokemonAPI("/api/v2/pokemon", queryParams);
    List<Pokemon> pokemon = [];
    var id = offset + 1;
    for (var pokemonJson in resJson['results']) {
      pokemon.add(Pokemon.fromJson(id, pokemonJson));
      id++;
    }
    return pokemon;
  }

  @override
  Future<PokemonDetails> getPokemonDetails(int index) async {
    var res = await getJsonStringFromPokemonAPI("/api/v2/pokemon/$index", {});
    return PokemonDetails.fromJson(res);
  }

  @override
  Future<List<PokemonWithDetails>> getPokemonWithDetails(
      int offset, int limit) async {
    List<PokemonWithDetails> pokemonWithDetails = [];
    var pokemons = await getPokemonAsList(offset, limit);
    for (var pokemon in pokemons) {
      var details = await getPokemonDetails(pokemon.id);
      pokemonWithDetails.add(PokemonWithDetails(pokemon, details));
    }
    return pokemonWithDetails;
  }

  Future<dynamic> getJsonStringFromPokemonAPI(
      String unencodedPath, Map<String, String> queryParams) async {
    var authority = "pokeapi.co";
    var uri = Uri.https(authority, unencodedPath, queryParams);
    var response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return convert.jsonDecode(response.body);
    } else {
      throw HttpException(
          "Call to ${response.request?.url.toString()} failed. response code was: ${response.statusCode}");
    }
  }
}
