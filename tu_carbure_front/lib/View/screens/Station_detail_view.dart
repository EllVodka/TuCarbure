import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/widget/Station_list_carburant_widget.dart';
import 'package:tu_carbure_front/View/widget/Station_map_widget.dart';
import 'package:tu_carbure_front/ViewModel/Station_view_model.dart';

class StationDetailView extends StatefulWidget {
  static const routeName = "/station-detail";

  @override
  _StationDetailViewState createState() => _StationDetailViewState();
}

class _StationDetailViewState extends State<StationDetailView> {
  bool isFavorite = false;
  final StationViewModel _viewModel = StationViewModel();
  String? stationId;
  Station station = emptyStation();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchStation();
    _setFavorite();
  }

  _setFavorite() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = (prefs.getString('stationFavoriteId') ?? '') == stationId ? true: false;
    });
  }

  _toggleFavorite() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      if(isFavorite){
        prefs.setString('stationFavoriteId', stationId!);
      }else{
        prefs.setString('stationFavoriteId', '');
      }
    });
  }

  void _fetchStation() async {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    stationId = routeArgs['id'];
    Station fetchedStation = await _viewModel.getStationById(stationId!);
    setState(() {
      station = fetchedStation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 7, 14, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Image.asset('assets/tu_carbure_logo.png', width: 150)),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: _toggleFavorite,
              style: ElevatedButton.styleFrom(
                backgroundColor: isFavorite? Color.fromRGBO(79, 59, 8, 1):Color.fromRGBO(7, 26, 79, 1),
              ),
              child: Text(
                'Ajout Favoris',
                style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StationMap(station),
          StationListCarburant(station),
        ],
      ),
    );
  }
}
