import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_app_flutter/features/pokedex/route.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: false,
        ),
        home: PokedexRoute(
          repository: PokemonRepository(dio: Dio()),
        ));
  }
}
