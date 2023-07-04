import 'package:flutter/material.dart';

class StationMap extends StatelessWidget {
  const StationMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: Container(),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
