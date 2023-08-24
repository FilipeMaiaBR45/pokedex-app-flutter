import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/common/models/pokemon.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app_flutter/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: list.map((e) => PokemonItemWidget(pokemon: e)).toList(),
      ),
    );
  }
}
