import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configurations/theme.dart';
import 'package:pokedex/pokemon_list/pokemon_list_screen.dart';
import 'package:pokedex/shared/pokeapi/cubit/pokemon_cubit.dart';
import 'package:pokedex/shared/pokeapi/web_pokeapi.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex',
        color: Colors.white,
        theme: Themings.mainTheme,
        home: BlocProvider(
            create: (context) => PokemonCubit(WebPokeApi()),
            child: Scaffold(
                appBar: AppBar(title: const Text("Pokedex!")),
                body: const PokemonListScreen())));
  }
}
