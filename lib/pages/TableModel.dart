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
  Response response;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    welcomeGet: json["get"],
    parameters: Parameters.fromJson(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromJson(json["paging"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "get": welcomeGet,
    "parameters": parameters.toJson(),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "results": results,
    "paging": paging.toJson(),
    "response": response.toJson(),
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
    required this.team,
    required this.season,
    required this.league,
  });

  String team;
  String season;
  String league;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    team: json["team"],
    season: json["season"],
    league: json["league"],
  );

  Map<String, dynamic> toJson() => {
    "team": team,
    "season": season,
    "league": league,
  };
}

class Response {
  Response({
    required this.league,
    required this.team,
    required this.form,
    required this.fixtures,
    required this.goals,
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
    required this.penalty,
    required this.lineups,
    required this.cards,
  });

  League league;
  Team team;
  String form;
  Fixtures fixtures;
  ResponseGoals goals;
  Biggest biggest;
  CleanSheet cleanSheet;
  CleanSheet failedToScore;
  Penalty penalty;
  List<Lineup> lineups;
  Cards cards;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    league: League.fromJson(json["league"]),
    team: Team.fromJson(json["team"]),
    form: json["form"],
    fixtures: Fixtures.fromJson(json["fixtures"]),
    goals: ResponseGoals.fromJson(json["goals"]),
    biggest: Biggest.fromJson(json["biggest"]),
    cleanSheet: CleanSheet.fromJson(json["clean_sheet"]),
    failedToScore: CleanSheet.fromJson(json["failed_to_score"]),
    penalty: Penalty.fromJson(json["penalty"]),
    lineups: List<Lineup>.from(json["lineups"].map((x) => Lineup.fromJson(x))),
    cards: Cards.fromJson(json["cards"]),
  );

  Map<String, dynamic> toJson() => {
    "league": league.toJson(),
    "team": team.toJson(),
    "form": form,
    "fixtures": fixtures.toJson(),
    "goals": goals.toJson(),
    "biggest": biggest.toJson(),
    "clean_sheet": cleanSheet.toJson(),
    "failed_to_score": failedToScore.toJson(),
    "penalty": penalty.toJson(),
    "lineups": List<dynamic>.from(lineups.map((x) => x.toJson())),
    "cards": cards.toJson(),
  };
}

class Biggest {
  Biggest({
    required this.streak,
    required this.wins,
    required this.loses,
    required this.goals,
  });

  Streak streak;
  Loses wins;
  Loses loses;
  BiggestGoals goals;

  factory Biggest.fromJson(Map<String, dynamic> json) => Biggest(
    streak: Streak.fromJson(json["streak"]),
    wins: Loses.fromJson(json["wins"]),
    loses: Loses.fromJson(json["loses"]),
    goals: BiggestGoals.fromJson(json["goals"]),
  );

  Map<String, dynamic> toJson() => {
    "streak": streak.toJson(),
    "wins": wins.toJson(),
    "loses": loses.toJson(),
    "goals": goals.toJson(),
  };
}

class BiggestGoals {
  BiggestGoals({
    required this.goalsFor,
    required this.against,
  });

  PurpleAgainst goalsFor;
  PurpleAgainst against;

  factory BiggestGoals.fromJson(Map<String, dynamic> json) => BiggestGoals(
    goalsFor: PurpleAgainst.fromJson(json["for"]),
    against: PurpleAgainst.fromJson(json["against"]),
  );

  Map<String, dynamic> toJson() => {
    "for": goalsFor.toJson(),
    "against": against.toJson(),
  };
}

class PurpleAgainst {
  PurpleAgainst({
    required this.home,
    required this.away,
  });

  int home;
  int away;

  factory PurpleAgainst.fromJson(Map<String, dynamic> json) => PurpleAgainst(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
  };
}

class Loses {
  Loses({
    required this.home,
    required this.away,
  });

  String home;
  String away;

  factory Loses.fromJson(Map<String, dynamic> json) => Loses(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
  };
}

class Streak {
  Streak({
    required this.wins,
    required this.draws,
    required this.loses,
  });

  int wins;
  int draws;
  int loses;

  factory Streak.fromJson(Map<String, dynamic> json) => Streak(
    wins: json["wins"],
    draws: json["draws"],
    loses: json["loses"],
  );

  Map<String, dynamic> toJson() => {
    "wins": wins,
    "draws": draws,
    "loses": loses,
  };
}

class Cards {
  Cards({
    required this.yellow,
    required this.red,
  });

  Map<String, Missed> yellow;
  Map<String, Missed> red;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
    yellow: Map.from(json["yellow"]).map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
    red: Map.from(json["red"]).map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "yellow": Map.from(yellow).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "red": Map.from(red).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Missed {
  Missed({
    required this.total,
    required this.percentage,
  });

  int total;
  String percentage;

  factory Missed.fromJson(Map<String, dynamic> json) => Missed(
    total: json["total"] == null ? null : json["total"],
    percentage: json["percentage"] == null ? null : json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "percentage": percentage == null ? null : percentage,
  };
}

class CleanSheet {
  CleanSheet({
    required this.home,
    required this.away,
    required this.total,
  });

  int home;
  int away;
  int total;

  factory CleanSheet.fromJson(Map<String, dynamic> json) => CleanSheet(
    home: json["home"],
    away: json["away"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
    "total": total,
  };
}

class Fixtures {
  Fixtures({
    required this.played,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  CleanSheet played;
  CleanSheet wins;
  CleanSheet draws;
  CleanSheet loses;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
    played: CleanSheet.fromJson(json["played"]),
    wins: CleanSheet.fromJson(json["wins"]),
    draws: CleanSheet.fromJson(json["draws"]),
    loses: CleanSheet.fromJson(json["loses"]),
  );

  Map<String, dynamic> toJson() => {
    "played": played.toJson(),
    "wins": wins.toJson(),
    "draws": draws.toJson(),
    "loses": loses.toJson(),
  };
}

class ResponseGoals {
  ResponseGoals({
    required this.goalsFor,
    required this.against,
  });

  FluffyAgainst goalsFor;
  FluffyAgainst against;

  factory ResponseGoals.fromJson(Map<String, dynamic> json) => ResponseGoals(
    goalsFor: FluffyAgainst.fromJson(json["for"]),
    against: FluffyAgainst.fromJson(json["against"]),
  );

  Map<String, dynamic> toJson() => {
    "for": goalsFor.toJson(),
    "against": against.toJson(),
  };
}

class FluffyAgainst {
  FluffyAgainst({
    required this.total,
    required this.average,
    required this.minute,
  });

  CleanSheet total;
  Average average;
  Map<String, Missed> minute;

  factory FluffyAgainst.fromJson(Map<String, dynamic> json) => FluffyAgainst(
    total: CleanSheet.fromJson(json["total"]),
    average: Average.fromJson(json["average"]),
    minute: Map.from(json["minute"]).map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "total": total.toJson(),
    "average": average.toJson(),
    "minute": Map.from(minute).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Average {
  Average({
    required this.home,
    required this.away,
    required this.total,
  });

  String home;
  String away;
  String total;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
    home: json["home"],
    away: json["away"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
    "total": total,
  };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
  };
}

class Lineup {
  Lineup({
    required this.formation,
    required this.played,
  });

  String formation;
  int played;

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
    formation: json["formation"],
    played: json["played"],
  );

  Map<String, dynamic> toJson() => {
    "formation": formation,
    "played": played,
  };
}

class Penalty {
  Penalty({
    required this.scored,
    required this.missed,
    required this.total,
  });

  Missed scored;
  Missed missed;
  int total;

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
    scored: Missed.fromJson(json["scored"]),
    missed: Missed.fromJson(json["missed"]),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "scored": scored.toJson(),
    "missed": missed.toJson(),
    "total": total,
  };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}
