import 'dart:convert';


List<Pokemon> pokemonsFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Pokemon>.from(
      jsonData['results'].map((x) => Pokemon.fromJson(x)));
}

class Pokemon {
  String numId;
  String name;
  String urlDetail;
  String urlImage;

  Pokemon({this.numId, this.name, this.urlDetail, this.urlImage});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var url = json["url"].toString();
    url = url.replaceRange(url.length - 1, url.length, "");

    var numId =
        url == null ? null : url.substring(url.lastIndexOf('/',url.length) + 1, url.length);

    return Pokemon(
      numId: numId,
      name: json["name"] == null ? '' : json["name"],
      urlDetail: json["url"] == null ? '' : json["url"],
      urlImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$numId.png",
    );
  }
}
