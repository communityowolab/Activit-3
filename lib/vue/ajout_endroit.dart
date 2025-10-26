import '../widgets/image_prise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io'; 
import '../providers/endroits_utilisateurs.dart';

// La classe doit être ConsumerStatefulWidget pour interagir avec Riverpod et gérer l'état local
class AjoutEndroit extends ConsumerStatefulWidget {
  const AjoutEndroit({super.key});

  @override
  ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}

class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
  final _nomController = TextEditingController();
  File? _imageSelectionnee; // Propriété pour stocker l'image capturée

  // Fonction de rappel pour recevoir l'image du widget ImagePrise
  void _definirImage(File image) {
    _imageSelectionnee = image;
  }

  void _enregistreEndroit() {
    final nomSaisi = _nomController.text;

    // Validation : s'assurer que le nom ET l'image sont présents
    if (nomSaisi.isEmpty || _imageSelectionnee == null) {
      // Dans une application réelle, on afficherait un SnackBar ou une alerte
      return; 
    }

    // Appel du Provider pour ajouter l'endroit
    ref.read(endroitsProvider.notifier).ajoutEndroit(
          nomSaisi,
          _imageSelectionnee!, // On utilise l'opérateur '!' car on a vérifié qu'il n'est pas nul
        );
    
    // Fermer la page et revenir à la liste
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un nouveau endroit"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Champ de saisie du nom
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            const SizedBox(height: 10),
            
            // Intégration du widget de prise de photo
            ImagePrise(onPhotoSelectionne: _definirImage),
            
            const SizedBox(height: 10),
            // Bouton d'ajout
            ElevatedButton.icon(
              onPressed: _enregistreEndroit,
              icon: const Icon(Icons.add),
              label: const Text('Ajouter un nouveau endroit'),
            ),
          ],
        ),
      ),
    );
  }
}