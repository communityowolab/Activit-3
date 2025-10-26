import 'package:flutter/material.dart';
import '../modele/endroit.dart';
import '../vue/endroit_detail.dart'; 

class EndroitsList extends StatelessWidget {
  const EndroitsList({super.key, required this.endroits}); 

  final List<Endroit> endroits;

  @override
  Widget build(BuildContext context) {
    if (endroits.isEmpty) {
      return Center(
        child: Text(
          "Pas d'endroits favoris pour le moment",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: endroits.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(endroits[index].image),
        ),
        title: Text(
          endroits[index].nom,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => EndroitDetail(
                endroit: endroits[index],
              ),
            ),
          );
        },
      ),
    );
  }
}