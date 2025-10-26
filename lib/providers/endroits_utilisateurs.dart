import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modele/endroit.dart';

class EndroitsUtilisateur extends StateNotifier<List<Endroit>> {
  EndroitsUtilisateur(): super([]);

  void ajoutEndroit(String nom, [dynamic imageFile]) {
    final nouvel = Endroit(nom: nom, imageFile: imageFile);
    state = [nouvel, ...state];
  }

  void supprimer(String id) {
    state = state.where((e) => e.id != id).toList();
  }
}

final endroitsProvider = StateNotifierProvider<EndroitsUtilisateur, List<Endroit>>(
  (ref) => EndroitsUtilisateur(),
);
