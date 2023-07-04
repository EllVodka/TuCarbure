import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tu_carbure_front/Model/Station.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';

class StationMap extends StatelessWidget {
  final Station station;
  const StationMap(this.station);

  static const pageTitle = 'Localisation';
  static const googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=St+Jean+Douai';

  void _openGoogleMaps(BuildContext context) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=St+Jean+Douai';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur'),
          content: Text('Impossible de lancer Google Maps.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _openGoogleMapsIntent(BuildContext context) {
    final intent = AndroidIntent(
      action: 'action_view',
      data: Uri.parse(googleMapsUrl).toString(),
      package: 'com.google.android.apps.maps',
    );
    intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                  color: Color.fromRGBO(7, 26, 79, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(station.latitude, station.longitude),
                      zoom: 17.50,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 50.0,
                            height: 50.0,
                            point: LatLng(50.369465744099635, 3.0860044668324575),
                            builder: (ctx) => Container(
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    nonRotatedChildren: [
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () =>
                                launch('https://openstreetmap.org/copyright'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child:  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ouvrir map button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(115, 23, 23, 1),
                    ),
                    child: const Text(
                      'Ouvrir map',
                      style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
