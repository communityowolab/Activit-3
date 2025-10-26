import 'package:flutter/material.dart';

class PageAccueil extends StatelessWidget {
  // Le constructeur est essentiel et résout l'erreur 'Couldn't find constructor'.
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold fournit la structure de base (AppBar, body, etc.).
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil de Mon Application'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        // Remplacez ce widget par le contenu réel de votre page d'accueil.
        child: Text(
          'Page d\'Accueil Chargée avec Succès!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}