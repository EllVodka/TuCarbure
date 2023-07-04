class Carburant {
  String nom;
  String nomEuropeen;
  double prix;
  DateTime dateMaj;

  Carburant({
    required this.nom,
    required this.nomEuropeen,
    required this.prix,
    required this.dateMaj,
  });

  factory Carburant.fromJson(Map<String, dynamic> json) => Carburant(
    nom: json["nom"],
    nomEuropeen: json["nomEuropeen"],
    prix: json["prix"]?.toDouble(),
    dateMaj: DateTime.parse(json["dateMaj"]),
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "nomEuropeen": nomEuropeen,
    "prix": prix,
    "dateMaj": "${dateMaj.year.toString().padLeft(4, '0')}-${dateMaj.month.toString().padLeft(2, '0')}-${dateMaj.day.toString().padLeft(2, '0')}",
  };
}