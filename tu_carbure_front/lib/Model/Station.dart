// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);
import 'dart:convert';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Coordonnes.dart';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

List<Station> stationsFromJson(String str) =>
    List<Station>.from(json.decode(str).map((x) => Station.fromJson(x)));

String stationToJson(Station data) => json.encode(data.toJson());

Station emptyStation(){
  return Station(
    id: '0',
    marque: '',
    voie: '',
    numVoie: 0,
    ville: '',
    codePostal: 0,
    coordonnees: Coordonnees(latitude: 0,longitude: 0),
    carburants: [
      Carburant(nom: '', nomEuropeen: '', prix: 0, dateMaj: DateTime.now())
    ],
  );
}

class Station {
  String id;
  String marque;
  String voie;
  int numVoie;
  String ville;
  int codePostal;
  Coordonnees coordonnees;
  List<Carburant> carburants;

  Station({
    required this.id,
    required this.marque,
    required this.voie,
    required this.numVoie,
    required this.ville,
    required this.codePostal,
    required this.coordonnees,
    required this.carburants,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    id: json["stationId"],
    marque: json["marque"],
    voie: json["voie"],
    numVoie: json["numVoie"],
    ville: json["ville"],
    codePostal: json["codePostal"],
    coordonnees: Coordonnees.fromJson(json["coordonnees"]),
    carburants: List<Carburant>.from(json["carburants"].map((x) => Carburant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stationId": id,
    "marque": marque,
    "voie": voie,
    "numVoie": numVoie,
    "ville": ville,
    "codePostal": codePostal,
    "coordonnees": coordonnees.toJson(),
    "carburants": List<dynamic>.from(carburants.map((x) => x.toJson())),
  };
}
