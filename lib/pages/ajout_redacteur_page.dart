import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AjoutRedacteurPage extends StatefulWidget {
  const AjoutRedacteurPage({super.key});

  @override
  State<AjoutRedacteurPage> createState() => _AjoutRedacteurPageState();
}

class _AjoutRedacteurPageState extends State<AjoutRedacteurPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomCtrl = TextEditingController();
  final _specCtrl = TextEditingController();
  bool _loading = false;

  Future<void> _ajouterRedacteur() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final data = {
      'nom': _nomCtrl.text.trim(),
      'specialite': _specCtrl.text.trim(),
    };

    await FirebaseFirestore.instance.collection('redacteurs').add(data);

    setState(() => _loading = false);
    // Afficher succès
    if (!mounted) return;
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        title: const Text('Succès'),
        content: const Text('Rédacteur ajouté avec succès.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)..pop()..pop();
            },
            child: const Text('OK'),
          )
        ],
      );
    });
  }

  @override
  void dispose() {
    _nomCtrl.dispose();
    _specCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un rédacteur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomCtrl,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez le nom' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _specCtrl,
                decoration: const InputDecoration(labelText: 'Spécialité'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez la spécialité' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _ajouterRedacteur,
                child: _loading ? const CircularProgressIndicator() : const Text('Ajouter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
