import 'package:flutter/material.dart';
import 'package:tu_carbure_front/View/Station_detail_view.dart';
import 'package:tu_carbure_front/View/Station_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tu Carbure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StationListView(),
      routes: {
          StationDetailView.routeName: (context) => StationDetailView(),
      },
    );
  }
}
