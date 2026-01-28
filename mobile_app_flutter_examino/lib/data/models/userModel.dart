class UserModel {
  final int? id;
  final String nom;
  final String prenom;
  final String email;
  final String? cne;
  final int? filiereId;
  final String? dateNs;

  UserModel({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    this.cne,
    this.filiereId,
    this.dateNs,
  });

  // Transforme le JSON de Laravel en objet Flutter
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      email: json['email'] ?? '',
      cne: json['cne'],
      filiereId: json['filiere_id'],
      dateNs: json['date_ns'],
    );
  }

  // Transforme l'objet Flutter en JSON pour l'envoyer à Laravel (Inscription)
  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'cne': cne,
      'filiere_id': filiereId,
      'date_ns': dateNs,
    };
  }
}