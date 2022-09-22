part of 'pokemon_cubit.dart';

enum LoadingStatus {
  initial,
  loading,
  success,
  error,
}

class PokemonState {
  final List<PokemonWithDetails> pokemon;
  final LoadingStatus loadingStatus;
  const PokemonState(this.pokemon, this.loadingStatus);
}
