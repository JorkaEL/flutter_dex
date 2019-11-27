import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/ui/pokedex/pokedex_page.dart';
import 'package:flutter_dex/ui/pokedex/pokemon_detail_page.dart';
import 'package:flutter_dex/ui/undefined/undefined_view.dart';
import 'package:flutter_dex/util/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case PokedexPageRoute:
      return MaterialPageRoute(builder: (context) => PokedexPage());
    case PokemonDetailPageRoute:
      return MaterialPageRoute(builder: (context) => PokemonDetailPage(pokemon: settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) =>  UndefinedView(name: settings.name));
  }
}