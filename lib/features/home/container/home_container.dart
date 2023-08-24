import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/error/failure.dart';
import 'package:pokedex_app_flutter/common/models/pokemon.dart';
import 'package:pokedex_app_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_app_flutter/features/home/pages/home_error.dart';
import 'package:pokedex_app_flutter/features/home/pages/home_loading.dart';
import 'package:pokedex_app_flutter/features/home/pages/home_pages.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({super.key, required this.repository});
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}