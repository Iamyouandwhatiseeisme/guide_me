import 'reverse_geodecoder_method.dart';

Future<String> displayLocationInfoInWords(
    latitude, longtitude, locationInfo, apiKey) async {
  final updatedLocationInfo =
      await GeocodingUtil.reverseGeocode(latitude, longtitude, apiKey);

  locationInfo = updatedLocationInfo;

  return locationInfo;
}
