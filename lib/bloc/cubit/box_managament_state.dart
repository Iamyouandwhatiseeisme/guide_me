part of 'box_managament_cubit.dart';

sealed class BoxManagamentState extends Equatable {
  final List<NearbyPlacesModel> listOfFavorites;
  const BoxManagamentState(this.listOfFavorites);

  @override
  List<Object> get props => [listOfFavorites];
}

final class BoxManagamentInitial extends BoxManagamentState {
  const BoxManagamentInitial(super.listOfFavorites);

  @override
  List<Object> get props => [listOfFavorites];
}

final class BoxManagementUpdated extends BoxManagamentState {
  const BoxManagementUpdated(super.listOfFavorites);

  @override
  List<Object> get props => [listOfFavorites];
}
