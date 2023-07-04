import 'dart:math';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Station.dart';

class StationViewModel {
  List<Station> stations = [];

  List<Station> fetchStation() {
    final fakeStations = <Station>[
      generateFakeStation('1', 'Ma Station 1', 'Rue de la Station 1', 123,
          'Ville Station 1', 12345, 48.8584, 2.2945, 1.5, 1.3, true),
      generateFakeStation('2', 'Ma Station 2', 'Rue de la Station 2', 456,
          'Ville Station 2', 67890, 48.859, 2.295, 1.6, 1.4, false),
      generateFakeStation('3', 'Ma Station 3', 'Rue de la Station 3', 789,
          'Ville Station 3', 13579, 48.860, 2.296, 1.7, 1.5, false),
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
}
