import 'package:flutter/material.dart';
import '../modele/endroit.dart'; 

class EndroitDetail extends StatelessWidget {
  const EndroitDetail({super.key, required this.endroit});

  final Endroit endroit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(endroit.nom),
      ),
      body: Column(
        children: [
          Image.file(
            endroit.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              endroit.nom,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}