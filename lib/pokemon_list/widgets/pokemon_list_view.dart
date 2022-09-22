import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_list_tile.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';

class PokemonListView extends StatelessWidget {
  final List<PokemonWithDetails> data;
  final bool isLoadingMore;
  final Widget loadingIcon;
  final void Function(PokemonWithDetails pokemonWithDetails)? onTap;
  final ScrollController? controller;
  const PokemonListView(
      {super.key,
      required this.data,
      this.controller,
      this.onTap,
      this.isLoadingMore = false,
      this.loadingIcon = const Center(child: CircularProgressIndicator())});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return GestureDetector(
                  onTap: () {
                    onTap?.call(data[index]);
                  },
                  child: PokemonListTile(data[index]));
            }), childCount: data.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            )),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return loadingIcon;
          }, childCount: 1),
        )
      ],
    );
  }
}
