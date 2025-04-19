class Location {
  String fullLocationName;
  String locationName;
  String sublocationName;
  double latitude;
  double longitude;
  String countryCode;
  bool isFavourite;

  Location({
    required this.fullLocationName,
    required this.locationName,
    required this.countryCode,
    required this.latitude,
    required this.sublocationName,
    required this.longitude,
    this.isFavourite = false,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      fullLocationName: json['fullLocationName'],
      locationName: json["locationName"],
      countryCode: json['countryCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      sublocationName: json['sublocationName'],
      isFavourite: json['isFavourite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sublocationName': sublocationName,
      'fullLocationName': fullLocationName,
      'latitude': latitude,
      'longitude': longitude,
      "locationName": locationName,
      'countryCode': countryCode,
      'isFavourite': isFavourite,
    };
  }
}
