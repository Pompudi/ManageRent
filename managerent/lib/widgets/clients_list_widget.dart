import 'package:flutter/material.dart';
import '../models/clientModel.dart';
import 'client_list_button.dart';

class ClientsListWidget extends StatelessWidget {
  final List<Client> clients;
  const ClientsListWidget({Key? key, required this.clients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClientListButton(
                    name: clients[index].name, client: clients[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
