class CubeScanner {
  int id;
  String ipAddress;
  int position;

  CubeScanner({
    required this.id,
    required this.ipAddress,
    required this.position,
  });

  static CubeScanner fromMap(Map<String, dynamic> data) {
    return CubeScanner(
      id: data['id'],
      ipAddress: data['ip_address'] ?? "",
      position: data['id_pickup_point'] ?? -1,
    );
  }
}
