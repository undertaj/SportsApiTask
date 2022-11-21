import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Widgets/LeagueContainer.dart';
import 'Model.dart';
import 'TableScreen.dart';
import 'package:http/http.dart' as http;

Future<List<Response>> fetch() async {
  final response = await http.get(
      Uri.parse('https://api-football-beta.p.rapidapi.com/teams?league=39&season=2019'),
  headers: {
    'X-RapidAPI-Key': 'ad02e133b9msh4a0bc2ce2884266p18f1a2jsn73e1e0d4d601',
    //ad02e133b9msh4a0bc2ce2884266p18f1a2jsn73e1e0d4d601
    'X-RapidAPI-Host': 'api-football-beta.p.rapidapi.com'
  });
  final responseJson = jsonDecode(response.body);
  return Welcome.fromJson(responseJson).response;

  // return compute(parsePhotos, response.body);
  // print(response.toString());
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:
      FutureBuilder<List<Response>>(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error has occurred! ${snapshot.error}'),
            );

          } else if (snapshot.hasData) {
            return TeamList(photos: snapshot.data!);
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

class TeamList extends StatelessWidget {
  const TeamList({super.key, required this.photos});

  final List<Response> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].team.logo);
      },
    );
    // print(photos[0].team.logo);
    // return Image.network(photos[0].team.logo);
  }
}
