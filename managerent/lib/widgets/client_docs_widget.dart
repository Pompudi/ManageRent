import "package:flutter/material.dart";
import 'package:managerent/design/colors.dart';

import 'package:managerent/widgets/background_widget.dart';
import 'package:managerent/widgets/collapsible_black_button.dart';
import 'package:managerent/widgets/title_page.dart';

import '../models/clientModel.dart';

class ClientDocsScreen extends StatefulWidget {
  final Client client;

  ClientDocsScreen({required this.client});
  @override
  _ClientDocsScreenState createState() => _ClientDocsScreenState();
}

class _ClientDocsScreenState extends State<ClientDocsScreen> {
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    final parts = widget.client.name.split(' ');
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 73, left: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitlePage(
                    title: 'Договоры клиента',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CollapsibleButton(
                    isButtonActive: isButtonActive,
                    itPressed: () {
                      setState(() {
                        isButtonActive = !isButtonActive;
                      });
                      Navigator.pop(context);
                    },
                    nameButton: '${parts[0]} ${parts[1]}',
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
