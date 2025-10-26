import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModifierRedacteurPage extends StatefulWidget {
  final String redacteurId;
  final Map<String, dynamic> redacteurData;

  const ModifierRedacteurPage({super.key, required this.redacteurId, required this.redacteurData});

  @override
  State<ModifierRedacteurPage> createState() => _ModifierRedacteurPageState();
}

class _ModifierRedacteurPageState extends State<ModifierRedacteurPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomCtrl;
  late TextEditingController _specCtrl;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nomCtrl = TextEditingController(text: widget.redacteurData['nom'] ?? '');
    _specCtrl = TextEditingController(text: widget.redacteurData['specialite'] ?? '');
  }

  @override
  void dispose() {
    _nomCtrl.dispose();
    _specCtrl.dispose();
    super.dispose();
  }

  Future<void> _enregistrerModifications() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await FirebaseFirestore.instance.collection('redacteurs').doc(widget.redacteurId).update({
      'nom': _nomCtrl.text.trim(),
      'specialite': _specCtrl.text.trim(),
    });
    setState(() => _loading = false);
    if (!mounted) return;
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        title: const Text('Succès'),
        content: const Text('Modifications enregistrées.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context)..pop()..pop(), child: const Text('OK'))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier rédacteur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nomCtrl, decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez le nom' : null),
              const SizedBox(height: 12),
              TextFormField(controller: _specCtrl, decoration: const InputDecoration(labelText: 'Spécialité'),
                validator: (v) => v == null || v.isEmpty ? 'Entrez la spécialité' : null),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _loading ? null : _enregistrerModifications, child: _loading ? const CircularProgressIndicator() : const Text('Enregistrer')),
            ],
          ),
        ),
      ),
    );
  }
}
