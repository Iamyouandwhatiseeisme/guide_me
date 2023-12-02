import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/first_page/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';

import '../main.dart';

void setUp() {
  sl.registerSingleton<NavigatorClient>(NavigatorClient());
  sl.registerSingleton<GeocodingUtil>(GeocodingUtil());
  sl.registerSingleton<CustomBottomNavigationBar>(
      const CustomBottomNavigationBar());
  sl.registerSingleton<FirebaseService>(FirebaseService());
  sl.registerSingleton<LocalDataSource>(LocalDataSource());
  sl.registerSingleton<GoogleDataSource>(GoogleDataSource());
  sl.registerSingleton<WeatherDataSource>(WeatherDataSource());
}

void registerLocationSingleton<T>(
  UserLocation userLocation,
) {
  if (!sl.isRegistered<UserLocation>()) {
    sl.registerSingleton<UserLocation>(UserLocation(
        userLat: userLocation.userLat, userLon: userLocation.userLon));
  }
}
