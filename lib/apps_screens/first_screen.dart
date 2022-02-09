import 'package:cc_rec/apps_screens/rules_screen.dart';
import 'package:cc_rec/apps_screens/settings_screen.dart';
import 'package:cc_rec/apps_screens/game_screen.dart';
import 'package:flutter/material.dart';

class homebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome To Tic Tac Toe"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return settingsscreen();
          }));
          debugPrint("Clicked Settings"); //Action code here
        },
        child: Icon(
          Icons.settings,
          //color: Colors.black,
        ),
        tooltip: 'Settings',
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 225.0),
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 60.0,
                    child: RaisedButton(
                        color: Colors.red,
                        child: Text(
                          "Play",
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontFamily: 'AUTOMANI'),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return game();
                              }));
                        }))),
            Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 60.0,
                    child: RaisedButton(
                        color: Colors.red,
                        child: Text(
                          "Rules",
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontFamily: 'AUTOMANI'),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Rules();
                          }));
                        })))
          ],
        ),
      ),
    );
  }
}
