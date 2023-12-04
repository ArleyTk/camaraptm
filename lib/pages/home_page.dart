import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imagePath;

  Future<void> _getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    PickedFile? _pickedFile = await _picker.getImage(source: source);

    if (_pickedFile != null) {
      setState(() {
        imagePath = _pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Seleccione o tome una imagen: '),
            (imagePath == null)
                ? Container()
                : Image.network
                    (imagePath!),
                  
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery),
              child: Text('Seleccionar imagen desde galería'),
            ),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child: Text('Tomar foto'),
            ),
          ],
        ),
      ),
    );
  }
}
