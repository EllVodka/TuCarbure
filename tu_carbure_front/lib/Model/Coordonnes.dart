
class Coordonnees {
  double latitude;
  double longitude;

  Coordonnees({
    required this.latitude,
    required this.longitude,
  });

  factory Coordonnees.fromJson(Map<String, dynamic> json) => Coordonnees(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}