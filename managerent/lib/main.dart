import 'package:flutter/material.dart';
import 'package:managerent/pages/home_page.dart';
import 'package:managerent/providerModel/client_list_provider.dart';
import 'package:managerent/providerModel/tab_index_provider.dart';
import 'package:provider/provider.dart';
import 'design/colors.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabIndexModel()),
        ChangeNotifierProvider(create: (context) => ClientListModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ManageRent',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: whiteColor,
          )),
      home: HomePage(),
    );
  }
}
