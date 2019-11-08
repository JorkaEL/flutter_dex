import 'package:flutter/material.dart';
import 'package:flutter_dex/pokedex.dart';


void main() => runApp(PokedexApp());


class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: PokedexPage(),
    );
  }
}