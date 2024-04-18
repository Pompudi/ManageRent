class Client {
  final int id;
  final String name;
  final String email;
  final String phone;
  final List<int> objectIds;
  final List<int> docsIds;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.objectIds,
    required this.docsIds,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      objectIds: (json['objectIds'] as List<dynamic>?)?.cast<int>() ?? [],
      docsIds: (json['docsIds'] as List<dynamic>?)?.cast<int>() ?? [],
    );
  }
}
