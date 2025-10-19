import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/endroits_utilisateurs.dart';
import '../widgets/endroits_list.dart';
import './ajout_endroit.dart'; 

// La classe doit être définie
class EndroitsInterface extends ConsumerWidget {
  const EndroitsInterface({super.key});

  void _ouvrirPageAjoutEndroit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AjoutEndroit(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endroitsUtilisateur = ref.watch(endroitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes endroits préférés"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _ouvrirPageAjoutEndroit(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EndroitsList(endroits: endroitsUtilisateur),
      ),
    );
  }
}