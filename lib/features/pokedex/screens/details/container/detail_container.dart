import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/error/failure.dart';
import 'package:pokedex_app_flutter/common/models/pokemon.dart';
import 'package:pokedex_app_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_app_flutter/common/widgets/po_error.dart';
import 'package:pokedex_app_flutter/common/widgets/po_loading.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key, required this.repository, required this.arguments});
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
              name: arguments.name,
              list: snapshot.data!,
            );
          }

          if (snapshot.hasError) {
            return PoError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
