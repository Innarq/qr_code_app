import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddQrFloatingButton extends StatelessWidget {
  final Function() onPressed;
  const AddQrFloatingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Colors.black,
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.all(13),
        child: SvgPicture.asset(
          "assets/add_qr.svg",
        ),
      ),
    );
  }
}