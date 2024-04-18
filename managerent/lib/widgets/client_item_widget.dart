import "package:flutter/material.dart";
import 'package:managerent/design/colors.dart';
import 'package:managerent/providerModel/client_list_provider.dart';
import 'package:managerent/widgets/add_button_widget.dart';
import 'package:managerent/widgets/background_widget.dart';
import 'package:managerent/widgets/collapsible_black_button.dart';
import 'package:managerent/widgets/title_page.dart';
import 'package:provider/provider.dart';

import '../models/clientModel.dart';

class ClientDetailsScreen extends StatefulWidget {
  final Client client;

  ClientDetailsScreen({required this.client});
  @override
  _ClientDetailsScreenState createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    final parts = widget.client.name.split(' ');
    final clientListModel =
        Provider.of<ClientListModel>(context, listen: false);
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
                    title: 'Обзор клиента',
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
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ФИО: ${widget.client.name}',
                            style: TextStyle(fontSize: 20, color: blackColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Номер: ${widget.client.phone}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: blackColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Эл. почта: ${widget.client.email}',
                            style: TextStyle(fontSize: 20, color: blackColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Список объектов',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AddButton(
                              nameButton: 'Добавить объект',
                              addFunction: () {}),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 180,
                          child: TextButton(
                            onPressed: () {
                              clientListModel.addToBlacklist(widget.client);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Добавить в черный список',
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  color: blackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 55,
                          width: 190,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Удалить контакт',
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
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
