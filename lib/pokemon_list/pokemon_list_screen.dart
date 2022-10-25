import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/pokemon_details/pokemon_details_screen.dart';
import 'package:pokedex/pokemon_list/widgets/pokemon_list_view.dart';
import 'package:pokedex/shared/pokeapi/models/pokemon_with_details.dart';
import 'package:pokedex/utils/ui_converters.dart';
import 'package:pokedex/widgets/main_app_bar.dart';
import '../shared/pokeapi/cubit/pokemon_cubit.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  PokemonCubit get pokemonCubit => BlocProvider.of<PokemonCubit>(context);

  final int _numberOfPostsPerRequest = 12;
  final List<PokemonWithDetails> pokemonWithDetails = [];

  final _scrollController = ScrollController();

  @override
  void initState() {
    fetchPokemon();

    _scrollController.addListener(() {
      var nextPageTrigger = _scrollController.position.maxScrollExtent * 0.9;

      if (_scrollController.position.pixels > nextPageTrigger) {
        fetchPokemon();
      }
    });
    super.initState();
  }

  void fetchPokemon() {
    pokemonCubit.loadPokemon(_numberOfPostsPerRequest);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
      if (state.loadingStatus == LoadingStatus.initial) {
        return Center(
            child: Lottie.asset("assets/pokeball_loading.json", height: 70));
      } else {
        return PokemonListView(
          data: state.pokemon,
          onTap: _navToPokemonDetailsScreen,
          controller: _scrollController,
          isLoadingMore: state.loadingStatus == LoadingStatus.loading,
          loadingIcon: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child:
                    Lottie.asset("assets/pokeball_loading.json", height: 50)),
          ),
        );
      }
    });
  }

  void _navToPokemonDetailsScreen(PokemonWithDetails pokemonWithDetails) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
            appBar: AppBar(
                backgroundColor: UIConverters.PokemonTypeToColor(
                    pokemonWithDetails.details.types[0]),
                elevation: 0),
            body: PokemonDetailsScreen(pokemonWithDetails))));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
