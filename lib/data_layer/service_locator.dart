import 'package:get_it/get_it.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/firebase_service.dart';
import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/data_layer/httpClients/weather_api_client.dart';
import 'package:guide_me/data_layer/localDataBase/local_data_base.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation_layer/widgets/navigation/navigator_client.dart';

class ServiceLocator {
  final sl = GetIt.instance;

  void setUp() {
    sl.registerSingleton<NavigatorClient>(NavigatorClient());
    sl.registerSingleton<GeocodingUtil>(GeocodingUtil());
    sl.registerSingleton<CustomBottomNavigationBar>(
        const CustomBottomNavigationBar());
    sl.registerSingleton<FirebaseService>(FirebaseService());
    sl.registerSingleton<LocalDataBase>(LocalDataBase());
    sl.registerSingleton<GoogleApiClient>(GoogleApiClient());
    sl.registerSingleton<WeatherApiClient>(WeatherApiClient());
  }

  void registerLocationSingleton(UserLocation userLocation) {
    if (!sl.isRegistered<UserLocation>()) {
      sl.registerSingleton<UserLocation>(UserLocation(
          userLat: userLocation.userLat, userLon: userLocation.userLon));
    }
  }
}
