import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid(); // final, pas const

class Endroit {
  final String id;
  final String nom;
  final File? imageFile;

  Endroit({
    String? id,
    required this.nom,
    this.imageFile,
  }) : id = id ?? uuid.v4();
}
