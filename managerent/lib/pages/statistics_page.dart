import 'package:flutter/material.dart';

import 'package:managerent/widgets/background_widget.dart';
import 'package:managerent/widgets/title_page.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return const MaterialApp(
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
                  TitlePage(title: 'Статистика'),
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
