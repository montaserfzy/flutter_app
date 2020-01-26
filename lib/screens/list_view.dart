import "package:flutter/material.dart";

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: Scaffold(
            appBar: AppBar(title: Text("List View Page")),
            body: getListView(),
          ),
        ));
  }
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.confirmation_number),
        title: Text('Item 1 in List view'),
        subtitle: Text("Sub Title For First Item in list"),
        trailing: Icon(Icons.wb_iridescent),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Item 1 in List view'),
        subtitle: Text("Sub Title For First Item in list"),
        trailing: Icon(Icons.wb_sunny),
      ),
      Text("Test Message"),
      Container(child: Text("What about the page"))
    ],
  );

  return listView;
}
