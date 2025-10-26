// lib/widgets/image_prise.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePrise extends StatefulWidget {
  final void Function(File image) onPhotoSelectionne;
  const ImagePrise({super.key, required this.onPhotoSelectionne});

  @override
  State<ImagePrise> createState() => _ImagePriseState();
}

class _ImagePriseState extends State<ImagePrise> {
  File? _photo;

  Future<void> _prendrePhoto() async {
    final picker = ImagePicker();
    final XFile? picture = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (picture == null) return;
    final file = File(picture.path);
    setState(() { _photo = file; });
    widget.onPhotoSelectionne(file);
  }

  @override
  Widget build(BuildContext context) {
    return _photo == null
      ? TextButton.icon(
          onPressed: _prendrePhoto,
          icon: const Icon(Icons.camera_alt),
          label: const Text("Prendre photo"),
        )
      : GestureDetector(
          onTap: _prendrePhoto,
          child: Image.file(_photo!, width: 200, height: 200, fit: BoxFit.cover),
        );
  }
}
