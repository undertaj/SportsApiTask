// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.welcomeGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String welcomeGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    welcomeGet: json["get"],
    parameters: Parameters.fromJson(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromJson(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "get": welcomeGet,
    "parameters": parameters.toJson(),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "results": results,
    "paging": paging.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    current: json["current"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "total": total,
  };
}

class Parameters {
  Parameters({
    required this.league,
    required this.season,
  });

  String league;
  String season;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    league: json["league"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "league": league,
    "season": season,
  };
}

class Response {
  Response({
    required this.team,
    required this.venue,
  });

  Team team;
  Venue venue;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    team: Team.fromJson(json["team"]),
    venue: Venue.fromJson(json["venue"]),
  );

  Map<String, dynamic> toJson() => {
    "team": team.toJson(),
    "venue": venue.toJson(),
  };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  int id;
  String name;
  String code;
  Country country;
  int founded;
  bool national;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    country: Country.ENGLAND,
    founded: json["founded"],
    national: json["national"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "country": countryValues.reverse[country],
    "founded": founded,
    "national": national,
    "logo": logo,
  };
}

enum Country { ENGLAND }

final countryValues = EnumValues({
  "England": Country.ENGLAND
});

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  int id;
  String name;
  String address;
  String city;
  int capacity;
  Surface surface;
  String image;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    city: json["city"],
    capacity: json["capacity"],
    surface: Surface.GRASS,
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "city": city,
    "capacity": capacity,
    "surface": surfaceValues.reverse[surface],
    "image": image,
  };
}

enum Surface { GRASS }

final surfaceValues = EnumValues({
  "grass": Surface.GRASS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
