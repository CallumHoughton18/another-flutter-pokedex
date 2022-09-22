class Pokemon {
  final int id;
  final String name;
  final String url;

  Pokemon({required this.name, required this.url, required this.id});
  Pokemon.fromJson(int pokemonId, Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'],
        id = pokemonId;
}

extension PokemonUtils on Pokemon {
  String get spriteUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
  }
}
