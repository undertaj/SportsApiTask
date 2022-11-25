// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TableModel tableModelFromJson(String str) => TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
  TableModel({
    required this.errors,
    required this.tableModelGet,
    required this.paging,
    required this.parameters,
    required this.response,
    required this.results,
  });

  List<dynamic> errors;
  String tableModelGet;
  Paging paging;
  Parameters parameters;
  Response response;
  int results;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    tableModelGet: json["get"],
    paging: Paging.fromJson(json["paging"]),
    parameters: Parameters.fromJson(json["parameters"]),
    response: Response.fromJson(json["response"]),
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "get": tableModelGet,
    "paging": paging.toJson(),
    "parameters": parameters.toJson(),
    "response": response.toJson(),
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
    required this.team,
  });

  String league;
  String season;
  String team;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    league: json["league"],
    season: json["season"],
    team: json["team"],
  );

  Map<String, dynamic> toJson() => {
    "league": league,
    "season": season,
    "team": team,
  };
}

class Response {
  Response({
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
    required this.fixtures,
    required this.form,
    required this.goals,
    required this.league,
    required this.team,
  });

  Biggest biggest;
  CleanSheet cleanSheet;
  CleanSheet failedToScore;
  Fixtures fixtures;
  String form;
  ResponseGoals goals;
  League league;
  Team team;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    biggest: Biggest.fromJson(json["biggest"]),
    cleanSheet: CleanSheet.fromJson(json["clean_sheet"]),
    failedToScore: CleanSheet.fromJson(json["failed_to_score"]),
    fixtures: Fixtures.fromJson(json["fixtures"]),
    form: json["form"],
    goals: ResponseGoals.fromJson(json["goals"]),
    league: League.fromJson(json["league"]),
    team: Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "biggest": biggest.toJson(),
    "clean_sheet": cleanSheet.toJson(),
    "failed_to_score": failedToScore.toJson(),
    "fixtures": fixtures.toJson(),
    "form": form,
    "goals": goals.toJson(),
    "league": league.toJson(),
    "team": team.toJson(),
  };
}

class Biggest {
  Biggest({
    required this.goals,
    required this.loses,
    required this.streak,
    required this.wins,
  });

  BiggestGoals goals;
  Loses loses;
  Streak streak;
  Loses wins;

  factory Biggest.fromJson(Map<String, dynamic> json) => Biggest(
    goals: BiggestGoals.fromJson(json["goals"]),
    loses: Loses.fromJson(json["loses"]),
    streak: Streak.fromJson(json["streak"]),
    wins: Loses.fromJson(json["wins"]),
  );

  Map<String, dynamic> toJson() => {
    "goals": goals.toJson(),
    "loses": loses.toJson(),
    "streak": streak.toJson(),
    "wins": wins.toJson(),
  };
}

class BiggestGoals {
  BiggestGoals({
    required this.against,
    required this.goalsFor,
  });

  PurpleAgainst against;
  PurpleAgainst goalsFor;

  factory BiggestGoals.fromJson(Map<String, dynamic> json) => BiggestGoals(
    against: PurpleAgainst.fromJson(json["against"]),
    goalsFor: PurpleAgainst.fromJson(json["for"]),
  );

  Map<String, dynamic> toJson() => {
    "against": against.toJson(),
    "for": goalsFor.toJson(),
  };
}

class PurpleAgainst {
  PurpleAgainst({
    required this.away,
    required this.home,
  });

  int away;
  int home;

  factory PurpleAgainst.fromJson(Map<String, dynamic> json) => PurpleAgainst(
    away: json["away"],
    home: json["home"],
  );

  Map<String, dynamic> toJson() => {
    "away": away,
    "home": home,
  };
}

class Loses {
  Loses({
    required this.away,
    required this.home,
  });

  String away;
  String home;

  factory Loses.fromJson(Map<String, dynamic> json) => Loses(
    away: json["away"],
    home: json["home"],
  );

  Map<String, dynamic> toJson() => {
    "away": away,
    "home": home,
  };
}

class Streak {
  Streak({
    required this.draws,
    required this.loses,
    required this.wins,
  });

  int draws;
  int loses;
  int wins;

  factory Streak.fromJson(Map<String, dynamic> json) => Streak(
    draws: json["draws"],
    loses: json["loses"],
    wins: json["wins"],
  );

  Map<String, dynamic> toJson() => {
    "draws": draws,
    "loses": loses,
    "wins": wins,
  };
}

class CleanSheet {
  CleanSheet({
    required this.away,
    required this.home,
    required this.total,
  });

  int away;
  int home;
  int total;

  factory CleanSheet.fromJson(Map<String, dynamic> json) => CleanSheet(
    away: json["away"],
    home: json["home"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "away": away,
    "home": home,
    "total": total,
  };
}

class Fixtures {
  Fixtures({
    required this.draws,
    required this.loses,
    required this.played,
    required this.wins,
  });

  CleanSheet draws;
  CleanSheet loses;
  CleanSheet played;
  CleanSheet wins;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
    draws: CleanSheet.fromJson(json["draws"]),
    loses: CleanSheet.fromJson(json["loses"]),
    played: CleanSheet.fromJson(json["played"]),
    wins: CleanSheet.fromJson(json["wins"]),
  );

  Map<String, dynamic> toJson() => {
    "draws": draws.toJson(),
    "loses": loses.toJson(),
    "played": played.toJson(),
    "wins": wins.toJson(),
  };
}

class ResponseGoals {
  ResponseGoals({
    required this.against,
    required this.goalsFor,
  });

  FluffyAgainst against;
  FluffyAgainst goalsFor;

  factory ResponseGoals.fromJson(Map<String, dynamic> json) => ResponseGoals(
    against: FluffyAgainst.fromJson(json["against"]),
    goalsFor: FluffyAgainst.fromJson(json["for"]),
  );

  Map<String, dynamic> toJson() => {
    "against": against.toJson(),
    "for": goalsFor.toJson(),
  };
}

class FluffyAgainst {
  FluffyAgainst({
    required this.average,
    required this.total,
  });

  Average average;
  CleanSheet total;

  factory FluffyAgainst.fromJson(Map<String, dynamic> json) => FluffyAgainst(
    average: Average.fromJson(json["average"]),
    total: CleanSheet.fromJson(json["total"]),
  );

  Map<String, dynamic> toJson() => {
    "average": average.toJson(),
    "total": total.toJson(),
  };
}

class Average {
  Average({
    required this.away,
    required this.home,
    required this.total,
  });

  String away;
  String home;
  String total;

  factory Average.fromJson(Map<String, dynamic> json) => Average(
    away: json["away"],
    home: json["home"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "away": away,
    "home": home,
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

  String country;
  String flag;
  int id;
  String logo;
  String name;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    country: json["country"],
    flag: json["flag"],
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "flag": flag,
    "id": id,
    "logo": logo,
    "name": name,
    "season": season,
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
