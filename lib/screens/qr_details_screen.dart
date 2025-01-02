import 'package:flutter/material.dart';
import 'package:qr_code_app/widgets/move_back_app_bar.dart';
import 'package:qr_code_app/widgets/saved_qr_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDetailsScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String url;

  const QrDetailsScreen({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.url,
  }) : super(key: key);

  final double contentWidth=250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E4E4),
      appBar: MoveBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 116.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              width: contentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 1,),
                  SavedQrImage(imagePath: imagePath, width: 70, height: 70),
                  SizedBox(width: 16,),
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 1,),
                ],
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: QrImageView(
                data: url,
                version: QrVersions.auto,
                size: contentWidth,
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(16)
              ),
            ),
          ],
        ),
      ),
    );
  }
}