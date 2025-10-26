import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SupprimerRedacteurPage extends StatelessWidget {
  final String redacteurId;
  final String redacteurNom;

  const SupprimerRedacteurPage({super.key, required this.redacteurId, required this.redacteurNom});

  Future<void> _supprimer(BuildContext context) async {
    await FirebaseFirestore.instance.collection('redacteurs').doc(redacteurId).delete();
    if (!context.mounted) return;
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        title: const Text('Supprimé'),
        content: Text('Le rédacteur "$redacteurNom" a été supprimé.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context)..pop()..pop(), child: const Text('OK')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmer la suppression')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Voulez-vous vraiment supprimer "$redacteurNom" ?'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => _supprimer(context), child: const Text('Supprimer')),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
          ],
        ),
      ),
    );
  }
}
