class Location {
  String locationName;
  double latitude;
  double longitude;
  String country;
  bool isFavourite;

  Location({
    required this.locationName,
    required this.country,
    required this.latitude,
    required this.longitude,
  }) : isFavourite = false;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationName: json['name'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'locationName': locationName,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
    };
  }
}
