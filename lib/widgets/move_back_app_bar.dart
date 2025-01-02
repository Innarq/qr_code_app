import 'package:flutter/material.dart';

class MoveBackAppBar extends AppBar {
  final backgroundColor = Colors.transparent;
  final elevation = 0;
  
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}