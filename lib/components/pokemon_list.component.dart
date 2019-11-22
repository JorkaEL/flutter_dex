import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/components/pokemon_title.component.dart';
import 'package:flutter_dex/model/pokemon.dart';

bool isFavorite = false;

class PokemonList extends StatelessWidget {
  PokemonList({
    Key key,
    @required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pokemons.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => PokemonTitle(
        pokemon: pokemons[index],
        isFavorite: isFavorite
      ),
    );
  }
}