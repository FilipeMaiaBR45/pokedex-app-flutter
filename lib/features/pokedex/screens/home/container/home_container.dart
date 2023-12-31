import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/error/failure.dart';
import 'package:pokedex_app_flutter/common/models/pokemon.dart';
import 'package:pokedex_app_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/home/pages/home_error.dart';

import 'package:pokedex_app_flutter/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/home/pages/home_pages.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key, required this.repository, required this.onItemTap});
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

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
            return HomePage(
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }

          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
