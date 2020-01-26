import 'dart:math';
import "package:flutter/material.dart";
import 'package:flutter_apps/screens/calculater.dart';
import 'package:flutter_apps/screens/drop_down.dart';
import 'package:flutter_apps/screens/list_view.dart';
import 'package:flutter_apps/screens/long_list_view.dart';
import 'package:flutter_apps/screens/state_full.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              generateLuckNumber(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Titi',
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
          Expanded(child: AssetsImages()),
          Container(child: FlightButton()),
        ],
      )),
    );
  }

  String generateLuckNumber() => "Your Lucky Number is ${Random().nextInt(9)}";
}

class AssetsImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage MontyImage = AssetImage('images/monty.jpg');
    Image image = Image(image: MontyImage, width: 180.0, height: 260.0);
    return Container(child: image);
  }
}

class FlightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculaterPage(),
            ),
          );
        },
        child: Text(
          "Click Here",
          style:
              TextStyle(fontFamily: "Titi", fontSize: 23.0, color: Colors.red),
        ),
        elevation: 6.0,
      ),
    );
  }

  void BookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Flight Booking'),
      content: Text("Booking Flight Successfully"),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
    );
  }
}
