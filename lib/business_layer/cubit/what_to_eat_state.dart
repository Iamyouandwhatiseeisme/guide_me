import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

sealed class WhatToEatState extends Equatable {
  const WhatToEatState();

  @override
  List<Object> get props => [];
}

final class WhatToEatInitial extends WhatToEatState {}

class WhatToEatLoading extends WhatToEatState {}

class WhatToEatLoaded extends WhatToEatState {
  final List<NearbyPlacesModel> listOfPlacesForWhatToEat;

  const WhatToEatLoaded(this.listOfPlacesForWhatToEat);

  @override
  List<Object> get props => [listOfPlacesForWhatToEat];
}

class WhatToEatError extends WhatToEatState {
  final String errorMessage;

  const WhatToEatError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
