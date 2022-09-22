import 'package:bloc/bloc.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'package:pokedex/shared/pokeapi/pokeapi.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokeApi api;
  PokemonCubit(this.api) : super(const PokemonState([], LoadingStatus.initial));

  void loadPokemon(int limit) async {
    if (state.loadingStatus == LoadingStatus.loading) return;

    List<PokemonWithDetails> pokemon = List.from(state.pokemon);
    var newStatus =
        pokemon.isEmpty ? LoadingStatus.initial : LoadingStatus.loading;
    emit(PokemonState(pokemon, newStatus));

    var newPokemon = await api.getPokemonWithDetails(pokemon.length, limit);
    pokemon.addAll(newPokemon);

    emit(PokemonState(pokemon, LoadingStatus.success));
  }
}
