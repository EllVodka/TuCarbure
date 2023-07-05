// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);
import 'dart:convert';
import 'package:tu_carbure_front/Model/Carburant.dart';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

List<Station> stationsFromJson(String str) =>
    List<Station>.from(json.decode(str).map((x) => Station.fromJson(x)));

String stationToJson(Station data) => json.encode(data.toJson());

Station emptyStation(){
  return Station(
    id: '0',
    marque: '',
    isFavorite: false,
    voie: '',
    numVoie: 0,
    ville: '',
    codePostal: 0,
    latitude: 0,
    longitude: 0,
    carburant: [
      Carburant(nom: '', nomEuropeen: '', prix: 0, dateMaj: DateTime.now())
    ],
  );
}

class Station {
  String id;
  String marque;
  List<Carburant> carburant;
  bool? isFavorite;
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
      id: json["stationId"],
      marque: json["marque"],
      carburant: List<Carburant>.from(
          json["carburants"].map((x) => Carburant.fromJson(x))),
      voie: json["voie"],
      numVoie: json["numVoie"],
      ville: json["ville"],
      codePostal: json["codePostal"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      isFavorite: false);

  Map<String, dynamic> toJson() => {
        "stationId": id,
        "marque": marque,
        "carburants": List<dynamic>.from(carburant.map((x) => x.toJson())),
        "voie": voie,
        "numVoie": numVoie,
        "ville": ville,
        "codePostal": codePostal,
        "latitude": latitude,
        "longitude": longitude,
      };
}
