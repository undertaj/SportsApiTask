import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'TableModel.dart';

Future<Response> fetchTeam(int teamId) async {
  final response = await http.get(
      Uri.parse('https://api-football-beta.p.rapidapi.com/teams/statistics?season=2019&team=$teamId&league=39'),
      headers: {
        'X-RapidAPI-Host': 'api-football-beta.p.rapidapi.com',
        'X-RapidAPI-Key': 'ad02e133b9msh4a0bc2ce2884266p18f1a2jsn73e1e0d4d601'
      });
  final responseJson = jsonDecode(response.body);
  print(responseJson.toString());
  return TableModel.fromJson(responseJson).response;

  // return compute(parsePhotos, response.body);
  // print(response.toString());
}

// Future<Response> updateTeamData(int teamId) async {
//   final res = http.put(
//     Uri.parse('https://api-football-beta.p.rapidapi.com/teams/statistics?season=2019&team=$teamId&league=39'),
//     headers: {
//       'Content-Type':
//     }
//   )
//
// }


class TeamPage extends StatelessWidget {
  const TeamPage({super.key, required this.teamIdNo, required this.teamName, required this.teamLogo});

  final int teamIdNo;
  final String teamName;
  final String teamLogo;

  final tab = const TabBar(
    indicatorColor: Colors.white,
      tabs: <Tab>[
    Tab(text: "Fixtures"),
    Tab(text: "Goals"),
  ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text(teamName)),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Center(child: Row(
              children: [
                Image.network(teamLogo, height: 50, width: 40,),
                Text("  $teamName", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
              ]
          ),),
          bottom: tab,
        ),

        body: FutureBuilder<Response>(
            future: fetchTeam(teamIdNo),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('An error has occurred! ${snapshot.error}'),
                );

              } else if (snapshot.hasData) {
                return TabBarView(
                    children: [
                      TeamData(teamStats: snapshot.data!),
                      Goals(teamStats: snapshot.data!),
                    ]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
    );

  }
}


class TeamData extends StatelessWidget {
  const TeamData({super.key, required this.teamStats});

  final Response teamStats;

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'HOME',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'AWAY',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'TOTAL',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('Games Played')),
                  DataCell(Text(teamStats.fixtures.played.home.toString())),
                  DataCell(Text(teamStats.fixtures.played.away.toString())),
                  DataCell(Text(teamStats.fixtures.played.total.toString())),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('Wins')),
                  DataCell(Text(teamStats.fixtures.wins.home.toString())),
                  DataCell(Text(teamStats.fixtures.wins.away.toString())),
                  DataCell(Text(teamStats.fixtures.wins.total.toString())),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('Draws')),
                  DataCell(Text(teamStats.fixtures.draws.home.toString())),
                  DataCell(Text(teamStats.fixtures.draws.away.toString())),
                  DataCell(Text(teamStats.fixtures.draws.total.toString())),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('Loses')),
                  DataCell(Text(teamStats.fixtures.loses.home.toString())),
                  DataCell(Text(teamStats.fixtures.loses.away.toString())),
                  DataCell(Text(teamStats.fixtures.loses.total.toString())),
                ],
              ),
            ],
          ),
        ],
      );
  }
}

class Goals extends StatelessWidget {
  const Goals({super.key, required this.teamStats});

  final Response teamStats;

  @override
  Widget build(BuildContext context) {

    return DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                '',
              ),
            ),
            DataColumn(
              label: Text(
                'HOME',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'AWAY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'TOTAL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: <DataRow>[
            const DataRow(
              cells: <DataCell>[
                DataCell(Text('Goals ',
                  style: TextStyle(fontWeight: FontWeight.bold))
                ),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text("")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Goals For')),
                DataCell(Text(teamStats.goals.goalsFor.total.home.toString())),
                DataCell(Text(teamStats.goals.goalsFor.total.away.toString())),
                DataCell(Text(teamStats.goals.goalsFor.total.total.toString())),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Goals Against')),
                DataCell(Text(teamStats.goals.against.total.home.toString())),
                DataCell(Text(teamStats.goals.against.total.away.toString())),
                DataCell(Text(teamStats.goals.against.total.total.toString())),
              ],
            ),
            const DataRow(
              cells: <DataCell>[
                DataCell(Text('Goals Average',
                    style: TextStyle(fontWeight: FontWeight.bold))
                ),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text("")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Goals For')),
                DataCell(Text(teamStats.goals.goalsFor.average.home.toString())),
                DataCell(Text(teamStats.goals.goalsFor.average.away.toString())),
                DataCell(Text(teamStats.goals.goalsFor.average.total.toString())),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Goals Against')),
                DataCell(Text(teamStats.goals.against.average.home.toString())),
                DataCell(Text(teamStats.goals.against.average.away.toString())),
                DataCell(Text(teamStats.goals.against.average.total.toString())),
              ],
            ),
          ],
        );
  }
}