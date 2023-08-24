import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_app_flutter/features/home/container/home_container.dart';
import 'package:pokedex_app_flutter/features/home/pages/home_pages.dart';

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
        useMaterial3: true,
      ),
      home: HomeContainer(
        repository: PokemonRepository(dio: Dio()),
      ),
    );
  }
}
