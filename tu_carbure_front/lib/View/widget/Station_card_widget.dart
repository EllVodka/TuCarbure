import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tu_carbure_front/Model/Station.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final int backgroundColorR;
  final int backgroundColorG;
  final int backgroundColorB;
  final double backgroundColorO;
  final Position currentPosition;

  StationCard(this.station, this.backgroundColorR, this.backgroundColorG,
      this.backgroundColorB, this.backgroundColorO, this.currentPosition);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                '${DateTime.now().difference(station.carburants.first.dateMaj).inDays} j',
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
                '${(Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, station.coordonnees.latitude, station.coordonnees.longitude) / 1000).toStringAsFixed(1)} km\n${(Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, station.coordonnees.latitude, station.coordonnees.longitude) / 1000).round() * 2} min',
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
                '${station.carburants.first.prix.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(244, 244, 246, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
