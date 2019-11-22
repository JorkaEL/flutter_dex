import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/components/pokemon_list.component.dart';
import 'package:flutter_dex/model/pokemon.dart';
import 'package:flutter_dex/util/network.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}


class _PokemonListPageState extends State<PokemonListPage> {
    Future<List<Pokemon>> listPokemon;

    @override
  void initState() {
      super.initState();
      listPokemon = Network().getPokemons();
    }

    @override build(BuildContext context) {
      return FutureBuilder<List<Pokemon>>(
        future: listPokemon,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred'),
            );
          } else {
            final pokemons = snapshot.data
                .where((pokemon) => pokemon.urlImage != null && pokemon.urlImage.length > 0).toList();

            return PokemonList(
              pokemons: pokemons,
            );
          }
        },
      );
    }
}