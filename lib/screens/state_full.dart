import 'package:flutter/material.dart';

class FavoriteCityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FavoriteCity());
  }
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<FavoriteCity> {
  var inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("State value "),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Test  $inputValue"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (String newText) {
                  setState(() {
                    inputValue = newText;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
