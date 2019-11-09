import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/pokemon.dart';

bool isFavorite = false;

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
      body: FutureBuilder<List<Pokemon>>(
        future: getPokemons(),
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

            return _PokemonList(
              pokemons: pokemons,
            );
          }
        },
      ),
    );
  }
}

class _PokemonList extends StatelessWidget {
  _PokemonList({
    Key key,
    @required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pokemons.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => _PokemonTile(
        pokemon: pokemons[index],
      ),
    );
  }
}

class _PokemonTile extends StatefulWidget {
  _PokemonTile({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  @override
  _PokemonTileState createState() {
    return new _PokemonTileState();
  }
}

class _PokemonTileState extends State<_PokemonTile> {

  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 56,
        height: 56,
        child: CachedNetworkImage(
          placeholder: (context, url) => Container(
            color: Colors.black12,
          ),
          imageUrl: widget.pokemon.urlImage,
          fit: BoxFit.contain,
        ),
      ),
      title: Text('#${widget.pokemon.numId} ${widget.pokemon.name}'),
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.lens : Icons.adjust),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}

/// Gets a list of pokemon from pokéApi.
Future<List<Pokemon>> getPokemons() async {
  String json;
  final response = await http.get(
      "https://pokeapi.co/api/v2/pokemon?offset=0&limit=964");
  if (response.statusCode == 200) {
    json = utf8.decode(response.bodyBytes);
  } else {
    json = await rootBundle.loadString('assets/places.json');
  }
  return pokemonsFromJson(json);
}
