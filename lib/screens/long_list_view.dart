import 'package:flutter/material.dart';

class LongListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Login List View")),
        body: getViewList(context),
      ),
    );
  }
}

List<String> generateListView() =>
    List<String>.generate(10, (item) => "Item $item");

Widget getViewList(BuildContext context) {
  var listItems = generateListView();

  ListView listView = new ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text(listItems[index]),
            subtitle: Text("Monty Test"),
            trailing: Icon(Icons.ac_unit),
            onTap: () {
              showSnackBar(context, listItems[index]);
            });
      });

  return listView;
}

void showSnackBar(BuildContext context, String itemValues) {
  var snack = SnackBar(
    content: Text("test $itemValues"),
  );
  Scaffold.of(context).showSnackBar(snack);
}
