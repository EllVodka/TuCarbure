import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/screens/Station_detail_view.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final int backgroundColorR;
  final int backgroundColorG;
  final int backgroundColorB;
  final double backgroundColorO;


  StationCard(this.station, this.backgroundColorR, this.backgroundColorG,
      this.backgroundColorB, this.backgroundColorO);

  void selectStation(BuildContext context) {
    Navigator.of(context).pushNamed(StationDetailView.routeName,
        arguments: {"id": station.id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectStation(context),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
        padding: const EdgeInsets.all(10.0),
        decoration: ShapeDecoration(
          color: Color.fromRGBO(backgroundColorR, backgroundColorG,
              backgroundColorB, backgroundColorO),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    station.marque,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(244, 244, 246, 1),
                    ),
                  )
                ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${station.carburant.first.dateMaj.difference(DateTime.now()).inDays} j',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(149, 149, 149, 1),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.route,
                    color: Color.fromRGBO(244, 244, 246, 1), size: 22),
                Text(
                  '10 km\n20 min',
                  style: const TextStyle(
                    fontSize: 13.0,
                    color: Color.fromRGBO(244, 244, 246, 1),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${station.carburant.first.prix.toStringAsFixed(2)} €',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(244, 244, 246, 1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
