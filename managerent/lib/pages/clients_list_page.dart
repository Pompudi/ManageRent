import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:managerent/providerModel/client_list_provider.dart';
import 'package:managerent/widgets/add_button_widget.dart';
import 'package:managerent/widgets/background_widget.dart';

import 'package:managerent/widgets/collapsible_black_button.dart';
import 'package:managerent/widgets/title_page.dart';
import 'package:provider/provider.dart';
import '../widgets/clients_list_widget.dart';
import '../models/clientModel.dart';

class ClientsListPage extends StatefulWidget {
  @override
  _ClientsListPageState createState() => _ClientsListPageState();
}

class _ClientsListPageState extends State<ClientsListPage> {
  // TODO: implement build
  bool _isBlacklistActive = false;
  bool _showAddClientForm = false;

  void _pressBlackList() {
    setState(() {
      _isBlacklistActive = !_isBlacklistActive;
    });
  }

  void _addClientForm() {
    setState(() {
      _showAddClientForm = !_showAddClientForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClientListModel()..loadClients(),
      child: MaterialApp(
        home: Scaffold(
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
                        title: 'Список клиентов',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CollapsibleButton(
                        isButtonActive: _isBlacklistActive,
                        itPressed: _pressBlackList,
                        nameButton: 'Черный список',
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Consumer<ClientListModel>(
                          builder: (context, clientListModel, child) {
                            // Используйте Provider.of
                            List<Client> currentClients = _isBlacklistActive
                                ? clientListModel.blackListClients
                                : clientListModel.clientsList;
                            return ClientsListWidget(clients: currentClients);
                          },
                        ),
                      ),
                      AddButton(
                        nameButton: 'Добавить контакт',
                        addFunction: _addClientForm,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _showAddClientForm,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'ФИО'),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Номер'),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'email'),
                                ),
                                SizedBox(
                                  height: 27,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Добавить'),
                                ),
                              ],
                            )),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
