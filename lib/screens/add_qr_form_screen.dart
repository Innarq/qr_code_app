import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AddQrFormScreen extends StatefulWidget {
  @override
  _AddQrFormScreenState createState() => _AddQrFormScreenState();
}

class _AddQrFormScreenState extends State<AddQrFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveFormData() async {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'name': _nameController.text,
        'url': _urlController.text,
        'imagePath': _selectedImage?.path ?? '',
      };

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/form_data.json');

      await file.writeAsString(jsonEncode(formData));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form data saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'GENERATE YOUR QR CODE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: fieldDecoration(placeholder: "Your code name"),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your code name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _urlController,
                  decoration: fieldDecoration(placeholder: "Your QR url"),
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your QR url';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.add),
                  label: Text('Add image (optional)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
                if (_selectedImage != null) ...[
                  SizedBox(height: 16),
                  Image.file(_selectedImage!, height: 150, fit: BoxFit.cover),
                ],
                SizedBox(height: 16),
                Divider(color: Colors.black),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _saveFormData,
                  child: Text('GENERATE QR CODE!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration fieldDecoration({String? placeholder = null}) {
    return InputDecoration(
      labelText: placeholder,
      labelStyle: TextStyle(color: Color(0xff313131)),
      alignLabelWithHint: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff313131)),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}