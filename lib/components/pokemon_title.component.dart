import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dex/model/pokemon.dart';
import 'package:flutter_dex/ui/pokedex/pokemon_detail_page.dart';
import 'package:flutter_dex/util/routing_constants.dart';

class PokemonTitle extends StatefulWidget {
  PokemonTitle({
    Key key,
    @required this.pokemon, this.isFavorite
  }) : super(key: key);

  final Pokemon pokemon;
  bool isFavorite;
  @override
  _PokemonTitleState createState() {
    return new _PokemonTitleState();
  }
}

class _PokemonTitleState extends State<PokemonTitle> {

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
        icon: Icon(widget.isFavorite ? Icons.lens : Icons.adjust),
        onPressed: () {
          setState(() {
            widget.isFavorite = !widget.isFavorite;
          });
        },
      ),
      onTap: () => Navigator.pushNamed(context, PokemonDetailPageRoute, arguments: widget.pokemon)
    );
  }
}
