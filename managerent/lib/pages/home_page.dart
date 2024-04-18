import 'package:flutter/material.dart';
import 'package:managerent/providerModel/tab_index_provider.dart';
import 'package:provider/provider.dart';

import 'clients_list_page.dart';
import 'rental_object_list_page.dart';
import 'statistics_page.dart';
import 'contracts_list_page.dart';
import '../design/images.dart' show NavigationBarImages;

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          Provider.of<TabIndexModel>(context, listen: false)
              .changeTabIndex(index);
        },
        children: [
          RentalObjectsPage(),
          ClientsListPage(),
          ContractsListPage(),
          StatisticsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: NavigationBarImages.homeBarImage,
            label: '',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavigationBarImages.homeBarImageSelect,
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationBarImages.clientBarImage,
            label: '',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavigationBarImages.clientBarImageSelect,
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationBarImages.docBarImage,
            label: '',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavigationBarImages.docBarImageSelect,
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationBarImages.statisticBarImage,
            label: '',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavigationBarImages.statisticBarImageSelect,
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
        ],
        currentIndex: Provider.of<TabIndexModel>(context).currentTabIndex,
        onTap: (index) {
          Provider.of<TabIndexModel>(context, listen: false)
              .changeTabIndex(index);
          _pageController.jumpToPage(index); // Обновление PageController
        },
      ),
    );
  }
}
