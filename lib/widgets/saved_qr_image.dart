import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SavedQrImage extends StatelessWidget {
  final String imagePath;
  final double width,height;
  const SavedQrImage({super.key, required this.imagePath, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final isFileImage = File(imagePath).existsSync();
    
    return isFileImage 
    ? SimpleShadow(
      child: Image.file(
        File(imagePath),
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
      opacity: 0.5,
      sigma: 6,
    )
    : Image.asset(
      imagePath==""?"assets/qr_code.png":imagePath,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}