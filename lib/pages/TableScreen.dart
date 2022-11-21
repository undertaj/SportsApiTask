import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

Future<List<Response>> fetch() async {
  final response = await http.get(
      Uri.parse('https://v3.football.api-sports.io/teams/statistics?season=2019&team=33&league=39'),
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
//
//   Widget buildTable() {
//     List<Widget> teams = [];
//     for (var team in _table) {
//       teams.add(
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     team['position'].toString().length > 1
//                         ? Text(team['position'].toString() + ' - ')
//                         : Text(" " + team['position'].toString() + ' - '),
//                     Row(
//                       children: [
//                         SvgPicture.network(
//                           team['team']['crestUrl'],
//                           height: 30,
//                           width: 30,
//                         ),
//                         team['team']['name'].toString().length > 11
//                             ? Text(team['team']['name']
//                             .toString()
//                             .substring(0, 11) +
//                             '...')
//                             : Text(team['team']['name'].toString()),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(team['playedGames'].toString()),
//                     Text(team['won'].toString()),
//                     Text(team['draw'].toString()),
//                     Text(team['lost'].toString()),
//                     Text(team['goalDifference'].toString()),
//                     Text(team['points'].toString()),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return Column(
//       children: teams,
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getTable();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _table == null
//         ? Container(
//       color: Colors.white,
//       child: Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(
//             Color(0xFFe70066),
//           ),
//         ),
//       ),
//     )
//         : Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 const Color(0xffe84860),
//                 const Color(0xffe70066),
//               ],
//               begin: const FractionalOffset(0.0, 0.0),
//               end: const FractionalOffset(0.0, 1.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             )),
//         child: ListView(
//           physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics()),
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Text(
//                           'Pos',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           'Club',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'PL',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'W',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'D',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'L',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'GD',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'Pts',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             buildTable(),
//           ],
//         ),
//       ),
//     );
//   }
// }