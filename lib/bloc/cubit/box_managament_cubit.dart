import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/data.dart';

part 'box_managament_state.dart';

class BoxManagamentCubit extends Cubit<BoxManagamentState> {
  List<NearbyPlacesModel> listOfFavorites;
  BoxManagamentCubit(this.listOfFavorites)
      : super(BoxManagamentInitial(listOfFavorites));

  deleteItem(NearbyPlacesModel place, Box<NearbyPlacesModel> box) {
    Hive.box<NearbyPlacesModel>('FavoritedPlaces').delete(place.hashCode);
    List<NearbyPlacesModel> listOfFavorites = this.listOfFavorites;
    listOfFavorites.clear();
    listOfFavorites = box.toMap().values.toList();
    emit(BoxManagementUpdated(listOfFavorites));
  }
}
