import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/widget/Station_list_carburant_widget.dart';
import 'package:tu_carbure_front/View/widget/Station_map_widget.dart';
import 'package:tu_carbure_front/ViewModel/Station_view_model.dart';

class StationDetailView extends StatelessWidget {
  static const routeName = "/station-detail";
  final StationViewModel _viewModel = StationViewModel();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final stationId = routeArgs['id'];
    final stationMarque = routeArgs['name'];
    final Station station =
        _viewModel.stations.where((element) => element.id == stationId).first;

    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 7, 14, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Image.asset('assets/tu_carbure_logo.png',width: 150,)),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Ajout Favoris button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(79, 59, 8, 1),
              ),
              child: Text(
                'Ajout Favoris',
                style: TextStyle(color: Color.fromRGBO(244,244,246,1)),
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
