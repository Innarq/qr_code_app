import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/saved_qr_image.dart';

class StyledMainTile extends StatelessWidget {
  final Color mainColor, secondaryColor;
  final String imagePath, text;
  final Function() onPressed;

  const StyledMainTile({
    super.key,
    required this.mainColor,
    required this.secondaryColor,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1.75),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SavedQrImage(imagePath: imagePath, width: 50, height: 50),
              ),
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}