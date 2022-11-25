
import 'package:api_task_lisha/pages/TableScreen.dart';
import 'package:flutter/material.dart';
import 'package:api_task_lisha/pages/HomeScreen.dart';

import 'Widgets/MyRoutes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'League 39';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}