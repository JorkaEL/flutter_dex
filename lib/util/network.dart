import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dex/model/pokemon.dart';
import 'package:http/http.dart' as http;

class Network {
  Network._internal();

  static final Network _network = Network._internal();

  factory Network() {
    return _network;
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
}