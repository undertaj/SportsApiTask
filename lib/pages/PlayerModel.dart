// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlayerModel playerModelFromJson(String str) => PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel {
  PlayerModel({
    required this.errors,
    required this.playerModelGet,
    required this.paging,
    required this.parameters,
    required this.response,
    required this.results,
  });

  List<dynamic> errors;
  String playerModelGet;
  Paging paging;
  Parameters parameters;
  List<Response> response;
  int results;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    playerModelGet: json["get"],
    paging: Paging.fromJson(json["paging"]),
    parameters: Parameters.fromJson(json["parameters"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "get": playerModelGet,
    "paging": paging.toJson(),
    "parameters": parameters.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "results": results,
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
    required this.player,
    required this.statistics,
  });

  Player player;
  List<Statistic> statistics;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    player: Player.fromJson(json["player"]),
    statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "player": player.toJson(),
    "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
  };
}

class Player {
  Player({
    required this.age,
    required this.birth,
    required this.firstname,
    required this.height,
    required this.id,
    required this.injured,
    required this.lastname,
    required this.name,
    required this.nationality,
    required this.photo,
    required this.weight,
  });

  int age;
  Birth birth;
  String firstname;
  String height;
  int id;
  bool injured;
  String lastname;
  String name;
  String nationality;
  String photo;
  String weight;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    age: json["age"],
    birth: Birth.fromJson(json["birth"]),
    firstname: json["firstname"],
    height: json["height"],
    id: json["id"],
    injured: json["injured"],
    lastname: json["lastname"],
    name: json["name"],
    nationality: json["nationality"],
    photo: json["photo"],
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "birth": birth.toJson(),
    "firstname": firstname,
    "height": height,
    "id": id,
    "injured": injured,
    "lastname": lastname,
    "name": name,
    "nationality": nationality,
    "photo": photo,
    "weight": weight,
  };
}

class Birth {
  Birth({
    required this.country,
    required this.date,
    required this.place,
  });

  String country;
  DateTime date;
  String place;

  factory Birth.fromJson(Map<String, dynamic> json) => Birth(
    country: json["country"],
    date: DateTime.parse(json["date"]),
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "place": place,
  };
}

class Statistic {
  Statistic({
    required this.cards,
    required this.dribbles,
    required this.duels,
    required this.fouls,
    required this.games,
    required this.goals,
    required this.league,
    required this.passes,
    required this.penalty,
    required this.shots,
    required this.substitutes,
    required this.tackles,
    required this.team,
  });

  Cards cards;
  Dribbles dribbles;
  Duels duels;
  Fouls fouls;
  Games games;
  Goals goals;
  League league;
  Passes passes;
  Penalty penalty;
  Shots shots;
  Substitutes substitutes;
  Tackles tackles;
  Team team;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    cards: Cards.fromJson(json["cards"]),
    dribbles: Dribbles.fromJson(json["dribbles"]),
    duels: Duels.fromJson(json["duels"]),
    fouls: Fouls.fromJson(json["fouls"]),
    games: Games.fromJson(json["games"]),
    goals: Goals.fromJson(json["goals"]),
    league: League.fromJson(json["league"]),
    passes: Passes.fromJson(json["passes"]),
    penalty: Penalty.fromJson(json["penalty"]),
    shots: Shots.fromJson(json["shots"]),
    substitutes: Substitutes.fromJson(json["substitutes"]),
    tackles: Tackles.fromJson(json["tackles"]),
    team: Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "cards": cards.toJson(),
    "dribbles": dribbles.toJson(),
    "duels": duels.toJson(),
    "fouls": fouls.toJson(),
    "games": games.toJson(),
    "goals": goals.toJson(),
    "league": league.toJson(),
    "passes": passes.toJson(),
    "penalty": penalty.toJson(),
    "shots": shots.toJson(),
    "substitutes": substitutes.toJson(),
    "tackles": tackles.toJson(),
    "team": team.toJson(),
  };
}

class Cards {
  Cards({
    required this.red,
    required this.yellow,
    required this.yellowred,
  });

  int red;
  int yellow;
  int yellowred;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
    red: json["red"],
    yellow: json["yellow"],
    yellowred: json["yellowred"],
  );

  Map<String, dynamic> toJson() => {
    "red": red,
    "yellow": yellow,
    "yellowred": yellowred,
  };
}

class Dribbles {
  Dribbles({
    required this.attempts,
    required this.past,
    required this.success,
  });

  int attempts;
  dynamic past;
  int success;

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
    attempts: json["attempts"]?? 0,
    past: json["past"]??0,
    success: json["success"]??0,
  );

  Map<String, dynamic> toJson() => {
    "attempts": attempts,
    "past": past,
    "success": success,
  };
}

class Duels {
  Duels({
    required this.total,
    required this.won,
  });

  int total;
  int won;

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
    total: json["total"] == null ? null : json["total"],
    won: json["won"] == null ? null : json["won"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "won": won == null ? null : won,
  };
}

class Fouls {
  Fouls({
    required this.committed,
    required this.drawn,
  });

  int committed;
  int drawn;

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
    committed: json["committed"],
    drawn: json["drawn"],
  );

  Map<String, dynamic> toJson() => {
    "committed": committed,
    "drawn": drawn,
  };
}

class Games {
  Games({
    required this.appearences,
    required this.captain,
    required this.lineups,
    required this.minutes,
    required this.number,
    required this.position,
    required this.rating,
  });

  int appearences;
  bool captain;
  int lineups;
  int minutes;
  dynamic number;
  Position? position;
  String rating;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
    appearences: json["appearences"],
    captain: json["captain"],
    lineups: json["lineups"],
    minutes: json["minutes"],
    number: json["number"],
    position: (positionValues.map[json["position"]]),
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "appearences": appearences,
    "captain": captain,
    "lineups": lineups,
    "minutes": minutes,
    "number": number,
    "position": position,
    "rating": rating,
  };
}

enum Position { ATTACKER, MIDFIELDER }

final positionValues = EnumValues({
  "Attacker": Position.ATTACKER,
  "Midfielder": Position.MIDFIELDER
});

class Goals {
  Goals({
    required this.assists,
    required this.conceded,
    required this.total,
  });

  int assists;
  dynamic conceded;
  int total;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
    assists: json["assists"],
    conceded: json["conceded"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "assists": assists,
    "conceded": conceded,
    "total": total,
  };
}

class League {
  League({
    required this.country,
    required this.flag,
    required this.id,
    required this.logo,
    required this.name,
    required this.season,
  });

  Country country;
  String flag;
  int id;
  String logo;
  Name name;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    country: Country.ENGLAND,
    flag: json["flag"],
    id: json["id"],
    logo: json["logo"],
    name: Name.PREMIER_LEAGUE,
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "flag": flag,
    "id": id,
    "logo": logo,
    "name": nameValues.reverse[name],
    "season": season,
  };
}

enum Country { ENGLAND }

final countryValues = EnumValues({
  "England": Country.ENGLAND
});

enum Name { PREMIER_LEAGUE }

final nameValues = EnumValues({
  "Premier League": Name.PREMIER_LEAGUE
});

class Passes {
  Passes({
    required this.accuracy,
    required this.key,
    required this.total,
  });

  int accuracy;
  int key;
  int total;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
    accuracy: json["accuracy"],
    key: json["key"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "accuracy": accuracy,
    "key": key,
    "total": total,
  };
}

class Penalty {
  Penalty({
    required this.commited,
    required this.missed,
    required this.saved,
    required this.scored,
    required this.won,
  });

  dynamic commited;
  int missed;
  dynamic saved;
  int scored;
  int won;

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
    commited: json["commited"],
    missed: json["missed"],
    saved: json["saved"],
    scored: json["scored"],
    won: json["won"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "commited": commited,
    "missed": missed,
    "saved": saved,
    "scored": scored,
    "won": won,
  };
}

class Shots {
  Shots({
    required this.on,
    required this.total,
  });

  int on;
  int total;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
    on: json["on"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "on": on,
    "total": total,
  };
}

class Substitutes {
  Substitutes({
    required this.bench,
    required this.substitutesIn,
    required this.out,
  });

  int bench;
  int substitutesIn;
  int out;

  factory Substitutes.fromJson(Map<String, dynamic> json) => Substitutes(
    bench: json["bench"],
    substitutesIn: json["in"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "bench": bench,
    "in": substitutesIn,
    "out": out,
  };
}

class Tackles {
  Tackles({
    required this.blocks,
    required this.interceptions,
    required this.total,
  });

  int blocks;
  int interceptions;
  int total;

  factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
    blocks: json["blocks"],
    interceptions: json["interceptions"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "blocks": blocks,
    "interceptions": interceptions,
    "total": total,
  };
}

class Team {
  Team({
    required this.id,
    required this.logo,
    required this.name,
  });

  int id;
  String logo;
  String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "name": name,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap ={};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
