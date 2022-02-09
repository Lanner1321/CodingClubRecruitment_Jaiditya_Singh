import 'package:flutter/material.dart';

class settingsimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/settings.jpg');
    Image image = Image(
      image: assetImage,
      width: 250,
      height: 250,
    );
    return Container(child: image);
  }
}

class settingsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Settings"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 150.0, bottom: 25),
                  child: settingsimage()),
              Text(
                "This is a dummy page for settings",
                style: TextStyle(
                    fontFamily: 'Sunset Club Free Trial',
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 30.0),
              )
            ],
          ),
        ));
  }
}
