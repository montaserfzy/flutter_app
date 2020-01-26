import "package:flutter/material.dart";

class DropDownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drop Down Page",
      home: Scaffold(
          appBar: AppBar(title: Text("Dop Down Page")), body: DropDownMain()),
    );
  }
}

class DropDownMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DropDownWedget();
  }
}

class DropDownWedget extends State<DropDownMain> {
  var countries = ["AAAA", "BBBB", "CCCC"];

  var selected = "AAAA";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          DropdownButton<String>(
              items: countries.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String selectedString) {
                onSelectedChange(selectedString);
              },
              value: selected)
        ],
      ),
    );
  }

  void onSelectedChange(String newValue) {
    setState(() {
      selected = newValue;
    });
  }
}
