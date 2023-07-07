import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Coordonnes.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;

class StationViewModel {
  static const String apiBaseUrl = 'https://192.168.51.41:7094';

  Future<Position> getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location Permssion are denied');
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<List<Station>> fetchStationFiltred(double latitude, double longitude,
      int distanceMax, String nomCarbu) async {
    http.Client client = http_io.IOClient(
      HttpClient()..badCertificateCallback = (cert, host, port) => true,
    );
  
    Map<String,dynamic> jsonFilter = {
      "latitude": latitude,
      "longitude": longitude,
      "distanceMax": distanceMax,
      "nomCarburant": nomCarbu
    };
    final response = await client
        .post(Uri.parse('$apiBaseUrl/getFilteredStation'), headers: {
      "content-type": "application/json"
    }, body: jsonEncode(jsonFilter));

    if (response.statusCode == 200) {
      var stations = stationsFromJson(response.body);
      return stations;
    } else {
      throw Exception('Failed to fetch fetchStation from API');
    }
  }

  Future<List<Station>> fetchStation() async {
    http.Client client = http_io.IOClient(
      HttpClient()..badCertificateCallback = (cert, host, port) => true,
    );

    final response = await client.get(Uri.parse('$apiBaseUrl/Station'));

    if (response.statusCode == 200) {
      var stations = stationsFromJson(response.body);
      return stations;
    } else {
      throw Exception('Failed to fetch fetchStation from API');
    }
  }

  Future<Station> getStationById(String id) async {
    http.Client client = http_io.IOClient(
      HttpClient()..badCertificateCallback = (cert, host, port) => true,
    );

    final response = await client.get(Uri.parse('$apiBaseUrl/$id'));

    if (response.statusCode == 200) {
      var station = stationFromJson(response.body);
      return station;
    } else {
      throw Exception('Failed to fetch GetStationById from API');
    }
  }
}

List<Station> fetchFakeStation() {
  final fakeStations = <Station>[
    generateFakeStation(
        '1',
        'Leclerc Macarez',
        'Rue Ernest Macarez',
        50,
        'Valenciennes',
        59300,
        50.373476452976234,
        3.541039941687799,
        1.5,
        1.3,
        false),
    generateFakeStation('2', 'Ma Station 2', 'Rue de la Station 2', 456,
        'Ville Station 2', 67890, 48.859, 2.295, 1.6, 1.4, false),
    generateFakeStation('3', 'Ma Station 3', 'Rue de la Station 3', 789,
        'Ville Station 3', 13579, 48.860, 2.296, 1.7, 1.5, true),
    generateFakeStation('4', 'Ma Station 4', 'Rue de la Station 4', 1011,
        'Ville Station 4', 24680, 48.861, 2.297, 1.8, 1.6, false),
    generateFakeStation('5', 'Ma Station 5', 'Rue de la Station 5', 1213,
        'Ville Station 5', 36912, 48.862, 2.298, 1.9, 1.7, false),
  ];
  return fakeStations;
}

Station generateFakeStation(
    String id,
    String marque,
    String voie,
    int numVoie,
    String ville,
    int codePostal,
    double latitude,
    double longitude,
    double prixEssence,
    double prixDiesel,
    bool isFavorite) {
  final carburants = [
    Carburant(
      nom: 'Essence',
      nomEuropeen: 'E10',
      prix: prixEssence,
      dateMaj: DateTime.now(),
    ),
    Carburant(
      nom: 'Diesel',
      nomEuropeen: 'B7',
      prix: prixDiesel,
      dateMaj: DateTime.now(),
    ),
    Carburant(
      nom: 'SuperEthanol',
      nomEuropeen: 'E85',
      prix: 0.5,
      dateMaj: DateTime.now(),
    ),
    Carburant(
      nom: 'SP98',
      nomEuropeen: 'E10',
      prix: prixEssence,
      dateMaj: DateTime.now(),
    ),
  ];

  return Station(
    id: id,
    marque: marque,
    voie: voie,
    numVoie: numVoie,
    ville: ville,
    codePostal: codePostal,
    coordonnees: Coordonnees(latitude: latitude, longitude: longitude),
    carburants: carburants,
  );
}
