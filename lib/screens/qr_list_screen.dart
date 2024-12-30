import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:qr_code_app/widgets/styled_main_tile.dart';

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
            childAspectRatio: 0.9,
            crossAxisSpacing: 26,
            mainAxisSpacing: 26,
          ),
          itemCount: items.length+1,
          itemBuilder: (context, index) {
            return index==items.length
            ? StyledMainTile(
              mainColor: Color(0xff111111),
              secondaryColor: Colors.black,
              text: "ADD QR CODE",
              imagePath: "assets/add.png",
              onPressed: (){Navigator.pushNamed(context, "/form");},
            )
            : StyledMainTile(
              mainColor: Color(0xffE4E4E4),
              secondaryColor: Color(0xff313131),
              text: items[index]["title"],
              imagePath: "assets/qr_code.png",
              onPressed: (){},
            );
          },
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(-20, -20), // Moves the button 100px from right and bottom
        child: FloatingActionButton(
          shape: CircleBorder(), // Ensures the button is a circle
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/form');
          },
          child: Container(
            margin: EdgeInsets.all(13),
            child: SvgPicture.asset(
              "assets/add_qr.svg",
            ),
          ),
        ),
      ),
    );
  }
}
