import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/widget/Station_Favorite_card_widget.dart';
import 'package:tu_carbure_front/View/widget/Station_card_widget.dart';
import 'package:tu_carbure_front/ViewModel/Station_view_model.dart';

class StationListView extends StatefulWidget {
  const StationListView({Key? key}) : super(key: key);

  @override
  State<StationListView> createState() => _StationListViewState();
}

class _StationListViewState extends State<StationListView> {
  final StationViewModel _viewmodel = StationViewModel();
  List<Station> stations = [];
  List<Station> stationNotFavorite = [];
   Station stationFavorite = Station(
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

  @override
  void initState() {
    super.initState();
    _fetchStation();
  }

  void _fetchStation() {
    List<Station> fetchedStation =_viewmodel.fetchStation();
    setState(() {
      stations = fetchedStation;
      stationFavorite = stations.firstWhere((element) => element.isFavorite, orElse: () => Station(
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
            Carburant(
                nom: '',
                nomEuropeen: '',
                prix: 0,
                dateMaj: DateTime.now())
          ]));
      stationNotFavorite = stations.where((station) => !station.isFavorite).toList();
    });
  }

  @override
  Widget build(BuildContext context) {


    return Material(
      color: const Color.fromRGBO(6, 7, 14, 1),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              'assets/tu_carbure_logo.png',
              width: 150,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  ' B7',
                  style: TextStyle(
                      fontSize: 16.0, color: Color.fromRGBO(244, 244, 246, 1)),
                ),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  // Logique du bouton
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(7, 26, 79, 1)
                ),
                child: const Text('Filtre'),
              ),
            ],
          ),
          StationFavoriteCard(stationFavorite, 79, 59, 8, 1),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
              itemCount: stationNotFavorite.length,
              itemBuilder: (BuildContext context, int index) {
                final station = stationNotFavorite[index];
                return StationCard(station, 7, 26, 79, 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
