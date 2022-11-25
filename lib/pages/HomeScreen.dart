import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Widgets/LeagueContainer.dart';
import 'Model.dart';
import 'PlayerScreen.dart';
import 'TableScreen.dart';
import 'package:http/http.dart' as http;
import '';

Future<List<Response>> fetch() async {
  // final Connectivity _connectivity = Connectivity();

  final response = await http.get(
      Uri.parse('https://api-football-beta.p.rapidapi.com/teams?league=39&season=2019'),
  headers: {
    'X-RapidAPI-Key': 'ad02e133b9msh4a0bc2ce2884266p18f1a2jsn73e1e0d4d601',
    'X-RapidAPI-Host': 'api-football-beta.p.rapidapi.com'
  });
  final responseJson = jsonDecode(response.body);
  return Welcome.fromJson(responseJson).response;

  // return compute(parsePhotos, response.body);
  // print(response.toString());
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => {
    subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
              isDeviceConnected = await InternetConnectionChecker().hasConnection;
              if(!isDeviceConnected && isAlertSet == false) {
                showDialogBox();
                setState(() {
                  isAlertSet = true;
                });
              }
            }
            )
  };

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text(widget.title)),
      ),
      body:
      FutureBuilder<List<Response>>(
        future: (isDeviceConnected) ? fetch() : null,
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
        drawer: Drawer(
          child: Column(
              children: [
                const SizedBox(height: 150,),
                GestureDetector(
                    child: const Text('Players', style: TextStyle(fontWeight: FontWeight.bold), selectionColor: Colors.white24,),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage()));
                    }
                ),
              ]
          ),
        )

    );
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your Internet Connectivity'),
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                isDeviceConnected = await InternetConnectionChecker().hasConnection;
                if(isDeviceConnected) {
                  setState(() {
                    isAlertSet = false;
                  });
                  Navigator.pop(context, 'Cancel');
                }

              },
              child: Text('OK'))

        ],
      ));
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
          return InkWell(
              child: Image.network(photos[index].team.logo),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamPage(teamIdNo: photos[index].team.id, teamName: photos[index].team.name, teamLogo: photos[index].team.logo,)));
            }

          );
        },
      );
    // print(photos[0].team.logo);
    // return Image.network(photos[0].team.logo);
  }
}
