import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../modele/redacteur.dart';
import 'modifier_redacteur_page.dart';
import 'supprimer_redacteur_page.dart';

class RedacteurInfoPage extends StatelessWidget {
  const RedacteurInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance.collection('redacteurs').snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text('Informations des rédacteurs')),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text('Erreur de chargement'));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) return const Center(child: Text('Aucun rédacteur'));

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final red = Redacteur.fromDoc(doc.id, data);

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(red.nom),
                  subtitle: Text(red.specialite),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) => ModifierRedacteurPage(redacteurId: red.id, redacteurData: data),
                          ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) => SupprimerRedacteurPage(redacteurId: red.id, redacteurNom: red.nom),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
