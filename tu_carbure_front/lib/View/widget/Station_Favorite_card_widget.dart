import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/screens/Station_detail_view.dart';

class StationFavoriteCard extends StatelessWidget {
  final Station station;
  final int backgroundColorR;
  final int backgroundColorG;
  final int backgroundColorB;
  final double backgroundColorO;
  final Position currentPosition;

  const StationFavoriteCard(
      this.station,
      this.backgroundColorR,
      this.backgroundColorG,
      this.backgroundColorB,
      this.backgroundColorO,
      this.currentPosition);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: station.id != '0',
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: ShapeDecoration(
          color: Color.fromRGBO(backgroundColorR, backgroundColorG,
              backgroundColorB, backgroundColorO),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    station.marque,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(244, 244, 246, 1),
                    ),
                  ),
                  const Icon(Icons.route,
                      color: Color.fromRGBO(244, 244, 246, 1)),
                  Text(
                    '${(Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, station.coordonnees.latitude, station.coordonnees.longitude) / 1000).toStringAsFixed(1)} km - ${(Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, station.coordonnees.latitude, station.coordonnees.longitude) / 1000).round() * 2} min',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(244, 244, 246, 1),
                    ),
                  ),
                ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${DateTime.now().difference(station.carburants.first.dateMaj).inDays} j',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(149, 149, 149, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${station.carburants.first.prix.toStringAsFixed(2)} €',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(244, 244, 246, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
