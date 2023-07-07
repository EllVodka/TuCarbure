import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:tu_carbure_front/ViewModel/Station_view_model.dart';

class StationListCarburant extends StatelessWidget {
  final Station station;
  final priceController = TextEditingController();
  final StationViewModel _viewmodel = StationViewModel();

  StationListCarburant(this.station);

  void _updatePrice(String nomCarbu, double newPrice) async {
    await _viewmodel.updatePrice(station.id, nomCarbu, newPrice);
  }

  void _showPopup(BuildContext context, String nomCarbu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifier le prix'),
          content: TextField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Nouveau prix',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _updatePrice(nomCarbu, double.parse(priceController.text));
                Navigator.of(context).pop();
              },
              child: Text('Modifier'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                  isThreeLine: true,
                  trailing: ElevatedButton(
                    onPressed: () {
                      _showPopup(context, carburant.nom);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(7, 26, 79, 1),
                        side: BorderSide(color: Colors.transparent)),
                    child: Icon(Icons.edit,
                        color: Color.fromRGBO(244, 244, 246, 1)),
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
