import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io'; // Import pour le type File
import '../modele/endroit.dart'; // Import de notre modèle Endroit

// La classe gère l'état : une liste immuable d'objets Endroit
class EndroitsUtilisateurs extends StateNotifier<List<Endroit>> {
  // Initialisation de la liste avec une liste vide
  EndroitsUtilisateurs() : super(const []);

  // Méthode pour ajouter un nouvel endroit à la liste
  void ajoutEndroit(String nom, File image) {
    // 1. Création du nouvel objet Endroit
    final nouvelEndroit = Endroit(nom: nom, image: image); 

    // 2. Mise à jour de l'état (création d'une nouvelle liste)
    state = [nouvelEndroit, ...state];
  }
}

// Le Provider global qui expose la classe de gestion d'état
final endroitsProvider = 
  StateNotifierProvider<EndroitsUtilisateurs, List<Endroit>>(
    (ref) => EndroitsUtilisateurs(),
  );