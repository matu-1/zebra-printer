import 'package:flutter/material.dart' show WidgetBuilder ;
import 'package:zebra_printer/pages/home_page.dart';

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (_) => HomePage(),
};