import 'package:flutter/material.dart';
import 'package:managerent/providerModel/tab_index_provider.dart';
import 'package:managerent/widgets/client_docs_widget.dart';
import 'package:managerent/widgets/client_item_widget.dart';
import 'package:provider/provider.dart';

import '../design/colors.dart';
import '../design/images.dart' show pencilImage;
import '../models/clientModel.dart';

class ClientListButton extends StatelessWidget {
  final String name;
  final Client client;

  const ClientListButton({
    Key? key,
    required this.name,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabIndexModel = Provider.of<TabIndexModel>(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        onPressed: () {
          if (tabIndexModel.currentTabIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClientDetailsScreen(client: client),
                maintainState: true,
              ),
            );
          } else if (tabIndexModel.currentTabIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClientDocsScreen(client: client),
              ),
            );
          }
        },
        child: Container(
            width: 361,
            height: 68.09,
            child: Row(
              //mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(color: whiteColor, fontSize: 24),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlueColor,
                  ),
                  onPressed: () {},
                  child: pencilImage,
                )
              ],
            ))

        /*Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: const TextStyle(color: whiteColor, fontSize: 24),
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: pencilImage,
          ),
        ],
      ),*/
        );
  }
}
