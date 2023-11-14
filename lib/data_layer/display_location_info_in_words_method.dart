import 'reverse_geodecoder_method.dart';

Future<String> displayLocationInfoInWords(
  latitude,
  longtitude,
  locationInfo,
) async {
  final updatedLocationInfo =
      await GeocodingUtil.reverseGeocode(latitude, longtitude);

  locationInfo = updatedLocationInfo;

  return locationInfo;
}
