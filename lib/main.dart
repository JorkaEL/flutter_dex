import 'package:flutter/material.dart';
import 'package:flutter_dex/util/router.dart' as router;
import 'package:flutter_dex/util/routing_constants.dart';


void main() => runApp(PokedexApp());


class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      onGenerateRoute: router.generateRoute,
      initialRoute: PokedexPageRoute);
  }
}