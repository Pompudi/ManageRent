import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/clientModel.dart';

class ClientListModel extends ChangeNotifier {
  List<Client> _clientsList = [];
  List<Client> _blackListClients = [];

  List<Client> get clientsList => _clientsList;
  List<Client> get blackListClients => _blackListClients;

  Future<void> loadClients() async {
    String clientsJson =
        await rootBundle.loadString('assets/jsonfile/clients.json');
    String blacklistJson =
        await rootBundle.loadString('assets/jsonfile/blacklist.json');
    List<dynamic> clientsListData = jsonDecode(clientsJson);
    List<dynamic> blackListData = jsonDecode(blacklistJson);
    _clientsList = clientsListData.map((e) => Client.fromJson(e)).toList();
    _blackListClients = blackListData.map((e) => Client.fromJson(e)).toList();

    notifyListeners();
  }

  void addToBlacklist(Client client) async {
    _blackListClients.add(client);
    _clientsList.remove(client);

    await _saveClients();
    notifyListeners();
  }

  Future<void> _saveClients() async {
    final directory = await getApplicationDocumentsDirectory();
    final clientsFile = File('${directory.path}/clients.json');
    final blacklistFile = File('${directory.path}/blacklist.json');

    // Сохранение клиентов в clients.json
    final clientsJson = jsonEncode(_clientsList);
    await clientsFile.writeAsString(clientsJson);

    // Сохранение черного списка в blacklist.json
    final blacklistJson = jsonEncode(_blackListClients);
    await blacklistFile.writeAsString(blacklistJson);
  }
  // ... (другие методы для управления списками)
}
