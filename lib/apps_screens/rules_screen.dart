import 'package:flutter/material.dart';

class Ximage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/x.png');
    Image image = Image(
      image: assetImage,
      width: 20,
      height: 20,
    );
    return Container(child: image);
  }
}

class Oimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/o.png');
    Image image = Image(
      image: assetImage,
      width: 20,
      height: 20,
    );
    return Container(child: image);
  }
}

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rules"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: ListView(
          children: [
            Padding(
            padding: EdgeInsets.only(top: 30,bottom: 25),
            child: Text(
              "Rules of Tic Tac Toe",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.red,
                  fontFamily: 'INDEPENDENT',
                  fontSize: 40.0),
            )),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "1. The aim of the game is to get 3 of the same shape in a line.",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Sunset Club Free Trial',
                      fontSize: 25.0),
                )),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "2. The line can either be Vertical, Horizontal or Diagonal.",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Sunset Club Free Trial',
                      fontSize: 25.0),
                )),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "3. X goes first followed by alternative turns between X and O.",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Sunset Club Free Trial',
                      fontSize: 25.0),
                )),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "4. The game ends when either one gets 3 in a line or when all the 9 squares are filled.",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Sunset Club Free Trial',
                      fontSize: 25.0),
                )),
          ],
        ),
      ),
    );
  }
}
