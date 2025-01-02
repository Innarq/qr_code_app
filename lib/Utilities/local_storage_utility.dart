import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageUtility {
  static Future<List<dynamic>> loadQrData(String path) async
  {
    final file = File(path);
    if (await file.exists()) {
      final jsonData = await file.readAsString();
      final data = jsonDecode(jsonData);

      return data["data"];
    }
    else {
      print("ERROR LOADING DATA: Path doesn't exist");
      return[];
    }
  }

  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    return pickedFile!=null ? File(pickedFile.path): null;
  }

  static Future<void> saveFormData(BuildContext context,
    {required GlobalKey<FormState> formKey, required String qrName, required String qrUrl, File? selectedImage}
  ) async {
    if (formKey.currentState!.validate()) {
      String? savedImagePath;
      if (selectedImage != null) {
        try {
          final directory = await getApplicationDocumentsDirectory();
          final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
          final savedImage = await selectedImage.copy(imagePath);
          savedImagePath = savedImage.path;
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving image: $e')),
          );
          return;
        }
      }

      final newEntry = {
        'name': qrName,
        'url': qrUrl,
        'imagePath': savedImagePath ?? '', // Save the new permanent image path
      };

      try {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/form_data.json');

        List<dynamic> existingData = [];

        if (await file.exists()) {
          final jsonData = await file.readAsString();
          final decodedData = jsonDecode(jsonData);
          if (decodedData is Map && decodedData.containsKey('data')) {
            existingData = decodedData['data'];
          }
        }

        existingData.add(newEntry);

        final updatedData = {'data': existingData};
        await file.writeAsString(jsonEncode(updatedData));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Code saved successfully!')),
        );

        Navigator.pop(context); // Return to the previous screen

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }
}