import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';

class StationListCarburant extends StatelessWidget {
  final Station station;
  const StationListCarburant(this.station);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        child: ListView.builder(
          primary: false,
          itemCount: station.carburants.length,
          itemBuilder: (context, index) {
            final carburant = station.carburants[index];
            return Material(
              color: Color.fromRGBO(6, 7, 14, 1),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: Color.fromRGBO(7, 26, 79, 1),
                  title: Text(
                    carburant.nom,
                    style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
                  ),
                  subtitle: Text(
                    '${carburant.prix.toStringAsFixed(2)} €',
                    style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
