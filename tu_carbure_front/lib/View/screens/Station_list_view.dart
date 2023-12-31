import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_carbure_front/Model/Carburant.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/screens/Station_detail_view.dart';
import 'package:tu_carbure_front/View/widget/Station_Favorite_card_widget.dart';
import 'package:tu_carbure_front/View/widget/Station_card_widget.dart';
import 'package:tu_carbure_front/View/widget/Station_popup_filter_widget.dart';
import 'package:tu_carbure_front/ViewModel/Station_favorite_view_model.dart';
import 'package:tu_carbure_front/ViewModel/Station_view_model.dart';

class StationListView extends StatefulWidget {
  const StationListView({Key? key}) : super(key: key);

  @override
  State<StationListView> createState() => _StationListViewState();
}

class _StationListViewState extends State<StationListView> {
  final StationViewModel _viewmodel = StationViewModel();
  bool isModalVisible = false;
  List<Station> stations = [];
  List<Station> stationNotFavorite = [];
  Station stationFavorite = emptyStation();
  late Position currentPosition;
  String currentFuel = "";

  @override
  void initState() {
    super.initState();
    _fetchStation(20000, "Gazole","B7");
  }

  void selectStation(BuildContext context, Station station) {
    Navigator.of(context).pushNamed(StationDetailView.routeName,
        arguments: {"id": station.id}).then((value) async {
      final prefs = await SharedPreferences.getInstance();
      var favoriteId = (prefs.getString('stationFavoriteId') ?? '');
      var fuel = (prefs.getString('fuel') ?? '');
      var codeEuro = (prefs.getString('codeEuro') ?? '');
      var distance = (prefs.getInt('distance') ?? 0);
      List<Station> fetchedStation = await _viewmodel.fetchStationFiltred(
          currentPosition.latitude,
          currentPosition.longitude,
          distance,
          fuel);
      setState(() {
        stations = fetchedStation;
        stationFavorite = stations.firstWhere(
          (element) => element.id == favoriteId,
          orElse: () => emptyStation(),
        );
        stationNotFavorite =
            stations.where((station) => station.id != favoriteId).toList();
        currentFuel = codeEuro;
      });
    });
  }

  void _fetchStation(int distance, String fuel,String codeEuro) async {
    final prefs = await SharedPreferences.getInstance();
    var currentPostionTemp = await _viewmodel.getCurrentPosition();
    List<Station> fetchedStation = await _viewmodel.fetchStationFiltred(
        currentPostionTemp.latitude,
        currentPostionTemp.longitude,
        distance,
        fuel);
    var favoriteId = (prefs.getString('stationFavoriteId') ?? '');
    setState(() {
      currentFuel = codeEuro;
      stations = fetchedStation;
      stationFavorite = stations.firstWhere(
        (element) => element.id == favoriteId,
        orElse: () => emptyStation(),
      );
      stationNotFavorite =
          stations.where((station) => station.id != favoriteId).toList();
      currentPosition = currentPostionTemp;

    });
  }

  void _toggleModal() {
    setState(() {
      isModalVisible = !isModalVisible;
    });
  }

  void _fetchWithFilter() async {
    final prefs = await SharedPreferences.getInstance();
    var fuel = (prefs.getString('fuel') ?? '');
    var codeEuro = (prefs.getString('codeEuro') ?? '');
    var distance = (prefs.getInt('distance') ?? 0);
    _fetchStation(distance, fuel,codeEuro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(6, 7, 14, 1),
      body: Stack(
        children: [
          Column(
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
                    child: Text(
                      currentFuel,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(244, 244, 246, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      _toggleModal();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(7, 26, 79, 1),
                    ),
                    child: const Text('Filtre'),
                  ),
                ],
              ),
              if (stations.isEmpty)
                const Center(
                  heightFactor: 5,
                  child: Text(
                    'Aucune station accessible',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              else
                InkWell(
                  onTap: () => selectStation(context, stationFavorite),
                  child: StationFavoriteCard(
                      stationFavorite, 79, 59, 8, 1, currentPosition),
                ),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: stationNotFavorite.length,
                  itemBuilder: (BuildContext context, int index) {
                    final station = stationNotFavorite[index];
                    return InkWell(
                      onTap: () => selectStation(context, station),
                      child:
                          StationCard(station, 7, 26, 79, 1, currentPosition,currentFuel),
                    );
                  },
                ),
              ),
            ],
          ),
          if (isModalVisible)
            GestureDetector(
              onTap: () {
                _toggleModal();
                _fetchWithFilter();
              },
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          if (isModalVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromRGBO(6, 7, 14, 1),
                child: const StationPopupFilter(),
              ),
            ),
        ],
      ),
    );
  }
}
