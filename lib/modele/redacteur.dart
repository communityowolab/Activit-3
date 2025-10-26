class Redacteur {
  final String id; // id Firestore (document id)
  final String nom;
  final String specialite;

  Redacteur({required this.id, required this.nom, required this.specialite});

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'specialite': specialite,
    };
  }

  factory Redacteur.fromDoc(String id, Map<String, dynamic> map) {
    return Redacteur(
      id: id,
      nom: map['nom'] ?? '',
      specialite: map['specialite'] ?? '',
    );
  }
}
