import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../models/clientModel.dart';

class ClientsRepository {
  Future<List<Client>> getClients() async {
    try {
      final response = await Dio().get(
          'https://rentclients.onrender.com/organizations/d21a836d-31cb-4987-bf5c-e768658a94e1/clients');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.data);
        return jsonData.map((json) => Client.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load clients');
      }
    } catch (error) {
      throw Exception('Error fetching clients: $error');
    }
  }
}
