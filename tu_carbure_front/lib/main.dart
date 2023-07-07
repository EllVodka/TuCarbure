import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tu_carbure_front/View/screens/Station_detail_view.dart';
import 'package:tu_carbure_front/View/screens/Station_list_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color =
  {
    50:Color.fromRGBO(6, 7, 14, .1),
    100:Color.fromRGBO(6, 7, 14, .2),
    200:Color.fromRGBO(6, 7, 14, .3),
    300:Color.fromRGBO(6, 7, 14, .4),
    400:Color.fromRGBO(6, 7, 14, .5),
    500:Color.fromRGBO(6, 7, 14, .6),
    600:Color.fromRGBO(6, 7, 14, .7),
    700:Color.fromRGBO(6, 7, 14, .8),
    800:Color.fromRGBO(6, 7, 14, .9),
    900:Color.fromRGBO(6, 7, 14, 1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tu Carbure',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF06070E,color),
      ),
      home: const StationListView(),
      routes: {
          StationDetailView.routeName: (context) => StationDetailView(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
