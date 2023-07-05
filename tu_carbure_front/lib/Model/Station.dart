// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);
import 'dart:convert';
import 'package:tu_carbure_front/Model/Carburant.dart';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  String id;
  String marque;
  List<Carburant> carburant;
  bool isFavorite;
  String voie;
  int numVoie;
  String ville;
  int codePostal;
  double latitude;
  double longitude;

  Station({
    required this.id,
    required this.marque,
    required this.carburant,
    required this.isFavorite,
    required this.voie,
    required this.numVoie,
    required this.ville,
    required this.codePostal,
    required this.latitude,
    required this.longitude,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
      id: json["_id"],
      marque: json["marque"],
      carburant: List<Carburant>.from(
          json["carburant"].map((x) => Carburant.fromJson(x))),
      voie: json["voie"],
      numVoie: json["numVoie"],
      ville: json["ville"],
      codePostal: json["codePostal"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      isFavorite: false);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "marque": marque,
        "carburant": List<dynamic>.from(carburant.map((x) => x.toJson())),
        "voie": voie,
        "numVoie": numVoie,
        "ville": ville,
        "codePostal": codePostal,
        "latitude": latitude,
        "longitude": longitude,
      };
}
