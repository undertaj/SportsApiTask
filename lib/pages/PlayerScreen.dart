import 'dart:convert';

import 'package:api_task_lisha/pages/PlayerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'PlayerModel.dart';

Future<List<Response>> fetchPlayer() async {
  final response = await http.get(
      Uri.parse('https://api-football-beta.p.rapidapi.com/players/topscorers?season=2019&league=39'),
      headers: {
        'X-RapidAPI-Host': 'api-football-beta.p.rapidapi.com',
        'X-RapidAPI-Key': 'ad02e133b9msh4a0bc2ce2884266p18f1a2jsn73e1e0d4d601'
      });
  final responseJson = jsonDecode(response.body);
  print(responseJson.toString());
  return PlayerModel.fromJson(responseJson).response;

  // print(response.toString());
}





class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          // appBar: AppBar(
          //   title: Center(child: Text(teamName)),
          // ),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(child:
                  Text("PLAYERS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
            )
          ),
          body: FutureBuilder<List<Response>>(
            future: fetchPlayer(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('An error has occurred! ${snapshot.error}'),
                );

              } else if (snapshot.hasData) {
                return PlayerData(playerStats: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );

  }
}

class PlayerData extends StatefulWidget {
  const PlayerData({super.key, required this.playerStats});
  final List<Response> playerStats;

  @override
  State<PlayerData> createState() => _PlayerDataState();
}

class _PlayerDataState extends State<PlayerData> {
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
    onRefresh: (){
      return Future(() => setState(() {}));
    },
    child: ListView.builder(
        itemCount: widget.playerStats.length,
        itemBuilder: (context, index) {
          return ListTile(
            minVerticalPadding: 15,
              tileColor: Colors.white,
              title: Text('Name:        ${widget.playerStats[index].player.firstname} ${widget.playerStats[index].player.lastname}\n'
                  'Team:        ${widget.playerStats[index].statistics[0].team.name}\n'
                  'Statistics:\n'
                  'Cards:       RED     YELLOW    YELLOWRED\n'
                  '                  ${widget.playerStats[index].statistics[0].cards.red}            ${widget.playerStats[index].statistics[0].cards.yellow}                 ${widget.playerStats[index].statistics[0].cards.yellowred}\n'
                  'Dribbles:    ATTEMPT     PAST    SUCCESS\n'
                  '                    ${widget.playerStats[index].statistics[0].dribbles.attempts}                   ${widget.playerStats[index].statistics[0].dribbles.past}                ${widget.playerStats[index].statistics[0].dribbles.success}\n',
                style: const TextStyle(color: Colors.black),),
            );
        }
        ),
    );

  }
}