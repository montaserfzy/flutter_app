import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class CalculaterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculater Page",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Scaffold(
//          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Calculater Page"),
            backgroundColor: Colors.black38,
            brightness: Brightness.light,
            // status bar brightness
          ),
          body: StateForm(),
        ),
      ),
    );
  }
}

class StateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateForm();
  }
}

class _StateForm extends State<StateForm> {
  var countries = ["Jordan", "USA", "Canada", "KSA"];
  var selectedItem = "";
  String displayString = '';
  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedItem = countries[0];
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.body2;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            showLogo(),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                style: textStyle,
                keyboardType: TextInputType.number,
                controller: principalController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter the Princeple";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Principal",
                  hintText: "Enter Principal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                style: textStyle,
                controller: rateController,
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter the Rate";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Rate of Intrest",
                  hintText: "Enter Rate of Intrest",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: textStyle,
                      controller: termController,
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter the Princeple";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: "Term",
                        hintText: "Enter Term",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Container(width: 10.5),
                  Expanded(
                      child: DropdownButton<String>(
                    items: countries.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    value: selectedItem,
                    onChanged: (String selected) {
                      setState(() {
                        selectedItem = selected;
                      });
                    },
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                    textTheme: Theme.of(context).buttonTheme.textTheme,
                    child: Text(
                      "Submit",
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          this.displayString = _calculate();
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).primaryColorLight,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text("Click2"),
                    onPressed: () {
                      setState(() {
                        _reset();
                      });
                    },
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("${this.displayString}"),
            )
          ],
        ),
      ),
    );
  }

  String _calculate() {
    double princaple = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);

    double result = princaple + (princaple + rate + term) / 100;
    return "you will spend $result $selectedItem";
  }

  void _reset() {
    principalController.text = "";
    rateController.text = "";
    termController.text = "";
    selectedItem = "KSA";
    displayString = "";
  }
}

Widget showLogo() {
  AssetImage assetImage = AssetImage("images/logo.png");
  Image image = Image(
    image: assetImage,
    width: 125.0,
    height: 125.0,
  );
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(20),
    child: image,
  );
}
