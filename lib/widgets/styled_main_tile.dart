import 'package:flutter/material.dart';

class StyledMainTile extends StatelessWidget {
  final Color mainColor, secondaryColor;
  final String imagePath, text;
  final Function() onPressed;
  const StyledMainTile({super.key, required this.mainColor, required this.secondaryColor, required this.imagePath, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1.75)
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(imagePath)
                )
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
                // border: Border.symmetric(color: Colors.black, width: 1.75)
              ),
              alignment: Alignment.center,
              child: Text(text, style: TextStyle(color: Colors.white),),
            ),
          ]
        ),
      )
    );
  }
}