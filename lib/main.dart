import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_loc.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      // base route (home), when we first open the app
      // value is functions which takes context object as argument,
      // which descirbes where in the widget tree we are
      '/home': (context) => Home(),
      '/choose_loc': (context) => ChoooseLocation()
    },
  ));
}
