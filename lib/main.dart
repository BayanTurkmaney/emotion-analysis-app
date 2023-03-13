import 'package:flutter/material.dart';
import './screens/welcome.dart';
import './screens/home.dart';
import './screens/results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          Welcome.route: (f) => Welcome(),
          Home.route: (f) => Home(),
          Results.route: (f) => Results(),
        });
  }
}
