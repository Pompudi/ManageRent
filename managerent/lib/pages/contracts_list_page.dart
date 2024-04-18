import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:managerent/design/colors.dart';
import 'package:managerent/widgets/background_widget.dart';
import 'package:managerent/widgets/collapsible_black_button.dart';
import 'package:managerent/widgets/title_page.dart';
import '../models/clientModel.dart';
import '../widgets/clients_list_widget.dart';

class ContractsListPage extends StatefulWidget {
  @override
  _ContractsListPageState createState() => _ContractsListPageState();
}

class _ContractsListPageState extends State<ContractsListPage> {
  List<Client> _clientsList = [];
  List<Client> _archiveClientsList = [];
  bool _isArchiveActive = false;

  Future<void> loadClients() async {
    String clietsJson = await DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/clients.json');
    String archiveJson = await DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/archive.json');
    List<dynamic> clietnsData = jsonDecode(clietsJson);
    List<dynamic> archiveData = jsonDecode(archiveJson);

    setState(
      () {
        _clientsList = clietnsData.map((e) => Client.fromJson(e)).toList();
        _archiveClientsList =
            archiveData.map((e) => Client.fromJson(e)).toList();
      },
    );
  }

  void _pressArchive() {
    setState(() {
      _isArchiveActive = !_isArchiveActive;
    });
  }

  @override
  void initState() {
    super.initState();
    loadClients();
  }

  @override
  Widget build(BuildContext context) {
    List<Client> currentClients =
        _isArchiveActive ? _archiveClientsList : _clientsList;
    return MaterialApp(
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
                  const TitlePage(title: 'Список договоров'),
                  const SizedBox(
                    height: 24,
                  ),
                  CollapsibleButton(
                      isButtonActive: _isArchiveActive,
                      itPressed: _pressArchive,
                      nameButton: 'Архив договоров'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ClientsListWidget(clients: currentClients),
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
