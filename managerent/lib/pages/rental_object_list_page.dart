import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:managerent/widgets/background_widget.dart';
import 'package:managerent/widgets/title_page.dart';

class RentalObjectsPage extends StatefulWidget {
  @override
  _RentalObjectsPageState createState() => _RentalObjectsPageState();
}

class _RentalObjectsPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          BackgroundPage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 73, left: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlePage(title: 'Арендные объекты'),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
