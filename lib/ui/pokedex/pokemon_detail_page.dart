import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/model/pokemon.dart';

class PokemonDetailPage extends StatefulWidget {

  PokemonDetailPage({
    Key key,
    @required this.pokemon
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  @override
  void initState() {
    super.initState();
  }

  @override build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(widget.pokemon.name)
        ),
      ),
    );
  }

}