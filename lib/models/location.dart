class Location {
  final String id; // Unique identifier for the location
  final String fullLocationName;
  final String locationName;
  final String sublocationName;
  final double latitude;
  final double longitude;
  final String countryCode;
  final bool isFavourite;

  // Constructor with id as a required field
  Location({
    required this.id, // Make sure to pass id when creating a Location object
    required this.fullLocationName,
    required this.locationName,
    required this.countryCode,
    required this.latitude,
    required this.sublocationName,
    required this.longitude,
    this.isFavourite = false,
  });

  // Factory constructor to create a Location object from JSON
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'], // Extract 'id' from JSON
      fullLocationName: json['fullLocationName'],
      locationName: json["locationName"],
      countryCode: json['countryCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      sublocationName: json['sublocationName'],
      isFavourite: json['isFavourite'] ?? false,
    );
  }

  // Convert Location object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include 'id' when serializing to JSON
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
