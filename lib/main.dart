import 'package:cc_rec/apps_screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      color: Colors.black,
      title: "Tic Tac Toe",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          accentColor: Colors.deepOrangeAccent),
      home: homebase()));

}
