import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/View/Station_detail_view.dart';

class StationFavoriteCard extends StatelessWidget {
  final Station station;
  final int backgroundColorR;
  final int backgroundColorG;
  final int backgroundColorB;
  final double backgroundColorO;

  const StationFavoriteCard(this.station, this.backgroundColorR,
      this.backgroundColorG, this.backgroundColorB, this.backgroundColorO);

  void selectStation(BuildContext context) {
    Navigator.of(context).pushNamed(StationDetailView.routeName,
        arguments: {"id": station.id, "name": station.marque});
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: station.isFavorite,
        child: InkWell(
          onTap: () => selectStation(context),
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
                      const Text(
                        '10 km - 20 min',
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
                      '${station.carburant.first.dateMaj.difference(DateTime.now()).inDays} j',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(149, 149, 149, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${station.carburant.first.prix.toStringAsFixed(2)} €',
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
        ));
  }
}
