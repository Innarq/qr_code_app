import 'package:flutter/material.dart';
import 'dart:convert';

class QrListScreen extends StatelessWidget {
  final String jsonData = '''
  [
    {"title": "Item 1", "subtitle": "Subtitle 1"},
    {"title": "Item 2", "subtitle": "Subtitle 2"},
    {"title": "Item 3", "subtitle": "Subtitle 3"},
    {"title": "Item 4", "subtitle": "Subtitle 4"}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = json.decode(jsonData);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index]['title']),
              subtitle: Text(items[index]['subtitle']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
