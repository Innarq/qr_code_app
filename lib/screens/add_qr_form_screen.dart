import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_app/Utilities/local_storage_utility.dart';
import 'package:qr_code_app/widgets/move_back_app_bar.dart';
import 'package:qr_code_app/widgets/styled_add_qr_form_field.dart';

class AddQrFormScreen extends StatefulWidget {
  @override
  _AddQrFormScreenState createState() => _AddQrFormScreenState();
}

class _AddQrFormScreenState extends State<AddQrFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  File? _selectedImage;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: MoveBackAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                StyledAddQrFormField(
                  controller: _nameController,
                  placeholder: "Your code name",
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your code name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                StyledAddQrFormField(
                  controller: _urlController,
                  placeholder: "Your QR url",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your QR url';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    _selectedImage = await LocalStorageUtility.pickImage();
                    setState(() {});
                  },
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
                  onPressed: (){LocalStorageUtility.saveFormData(context,
                    formKey: _formKey, qrName: _nameController.text, qrUrl: _urlController.text, selectedImage: _selectedImage
                  );},
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
}