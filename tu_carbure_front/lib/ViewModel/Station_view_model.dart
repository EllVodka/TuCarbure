import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;

class StationViewModel {
  List<Station> stations = [];

  static const String apiUrl = 'https://192.168.51.41:7094/Station';

  Future<List<Station>> fetchStation() async {
    http.Client client = http_io.IOClient(
      HttpClient()
        ..badCertificateCallback = (cert, host, port) => true,
    );

    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      stations = List<Station>.from(
          jsonData.map((data) => Station.fromJson(data)));
      return stations;
    } else {
      throw Exception('Failed to fetch InfoCarbu from API');
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
    generateFakeStation(
        '2',
        'Ma Station 2',
        'Rue de la Station 2',
        456,
        'Ville Station 2',
        67890,
        48.859,
        2.295,
        1.6,
        1.4,
        false),
    generateFakeStation(
        '3',
        'Ma Station 3',
        'Rue de la Station 3',
        789,
        'Ville Station 3',
        13579,
        48.860,
        2.296,
        1.7,
        1.5,
        true),
    generateFakeStation(
        '4',
        'Ma Station 4',
        'Rue de la Station 4',
        1011,
        'Ville Station 4',
        24680,
        48.861,
        2.297,
        1.8,
        1.6,
        false),
    generateFakeStation(
        '5',
        'Ma Station 5',
        'Rue de la Station 5',
        1213,
        'Ville Station 5',
        36912,
        48.862,
        2.298,
        1.9,
        1.7,
        false),
  ];
  return fakeStations;
}

Station generateFakeStation(String id,
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
    isFavorite: isFavorite,
    voie: voie,
    numVoie: numVoie,
    ville: ville,
    codePostal: codePostal,
    latitude: latitude,
    longitude: longitude,
    carburant: carburants,
  );
}

