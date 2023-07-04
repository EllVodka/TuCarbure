import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';
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
        _viewModel.fetchStation().where((element) => element.id == stationId).first;
    return Scaffold(
      appBar: AppBar(
        title: Text(stationMarque!),
      ),
      body: Text('tout va bien'),
    );
  }
}
