import 'package:flutter/material.dart';
import 'package:zebra_printer/pages/home_page.dart';
import 'package:zebra_printer/routes/routres.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}