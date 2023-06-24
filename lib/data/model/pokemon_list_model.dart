
class PokemonListModel {
  int? count;
  String? next;
  String? previous;
  List<Result>? results;


  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count= json["count"];
    next= json["next"];
    previous= json["previous"];
    if (json["results"] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["count"] = count;
    data["next"] = next;
    data["previous"] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? name;
  String? url;

  Result({
    required this.name,
    required this.url,
  });

  Result.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url =  json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["url"] = url;
    return data;
  }
}
