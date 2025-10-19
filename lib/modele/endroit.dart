import 'package:uuid/uuid.dart';
import 'dart:io'; 

const uuid = Uuid();

class Endroit {
  final String id;
  final String nom;
  final File image; 

  Endroit({
    required this.nom,
    required this.image, 
  }) : id = uuid.v4();
}