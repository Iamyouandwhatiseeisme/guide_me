class PlaceDetails {
  final String? adress;
  final String? number;
  final String? openHour;
  final String? closeHour;

  PlaceDetails(
      {required this.adress,
      required this.number,
      required this.openHour,
      required this.closeHour});

  factory PlaceDetails.fromJson(Map<String?, String?> json) {
    return PlaceDetails(
      adress: json['adress'],
      number: json['phone'],
      openHour: json['open_hour'],
      closeHour: json['close_hour'],
    );
  }
}
