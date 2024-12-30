import 'package:flutter/material.dart';
import 'dart:convert';

class QrListScreen extends StatelessWidget {
  final String jsonData = '''
  [
    {"title": "Item 1", "subtitle": "Subtitle 1"},
    {"title": "Item 2", "subtitle": "Subtitle 2"},
    {"title": "Item 3", "subtitle": "Subtitle 3"},
    {"title": "Item 4", "subtitle": "Subtitle 4"},
    {"title": "Item 1", "subtitle": "Subtitle 1"},
    {"title": "Item 2", "subtitle": "Subtitle 2"},
    {"title": "Item 3", "subtitle": "Subtitle 3"},
    {"title": "Item 1", "subtitle": "Subtitle 1"},
    {"title": "Item 2", "subtitle": "Subtitle 2"},
    {"title": "Item 3", "subtitle": "Subtitle 3"},
    {"title": "Item 4", "subtitle": "Subtitle 4"},
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
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 36),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 26,
            mainAxisSpacing: 26,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              height: 400,
              child: Column(
                children: [
                  Text(items[index]['title']),
                  Text(items[index]['subtitle']),
                ]
              ),
            );
          },
        ),
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
