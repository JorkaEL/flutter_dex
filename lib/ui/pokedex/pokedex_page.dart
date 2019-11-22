import 'package:flutter/material.dart';
import 'package:flutter_dex/ui/pokedex/pokemon_list_page.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
        child: Text('FlutterDex')
        ),
      ),
      body: PokemonListPage()
    );
  }
}
