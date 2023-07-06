import 'package:flutter/material.dart';

class StationPopupFilter extends StatefulWidget {
  const StationPopupFilter({Key? key}) : super(key: key);

  @override
  _StationPopupFilterState createState() => _StationPopupFilterState();
}

class _StationPopupFilterState extends State<StationPopupFilter> {
  int selectedIndexFuel = 0;
  int selectedIndexDistance = 0;

  final List<Map<String, String>> fuelTypes = [
    {'label': 'E5(SP95)', 'value': 'Sans Plomb 95'},
    {'label': 'E5(SP98)', 'value': 'Sans Plomb 98'},
    {'label': 'E10', 'value': 'Sans Plomb 95'},
    {'label': 'E85', 'value': ' Superéthanol E85'},
    {'label': 'B7', 'value': 'Gazole'},
    {'label': 'GPL', 'value': 'GPL'},
  ];

  final List<Map<String, String>> distance = [
    {'label': '1km', 'value': '1000'},
    {'label': '5km', 'value': '5000'},
    {'label': '10km', 'value': '10000'},
    {'label': '20km', 'value': '20000'},
    {'label': '50km', 'value': '50000'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Carburant',
            style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fuelTypes.length,
              itemBuilder: (context, index) {
                final fuelType = fuelTypes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndexFuel = index;
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (selectedIndexFuel == index) {
                            return const Color(0xFF4F3B08);
                          } else {
                            return const Color(0xFF071A4F);
                          }
                        },
                      ),
                    ),
                    child: Text(
                      fuelType['label']!,
                      style: const TextStyle(
                        color: Color(0xFFF4F4F6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Distance',
            style: TextStyle(color: Color.fromRGBO(244, 244, 246, 1)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: distance.length,
              itemBuilder: (context, index) {
                final fuelType = distance[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndexDistance = index;
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (selectedIndexDistance == index) {
                            return const Color(0xFF4F3B08);
                          } else {
                            return const Color(0xFF071A4F);
                          }
                        },
                      ),
                    ),
                    child: Text(
                      fuelType['label']!,
                      style: const TextStyle(
                        color: Color(0xFFF4F4F6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
