import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recommended_places_bloc_event.dart';
part 'recommended_places_bloc_state.dart';

class RecommendedPlacesBlocBloc extends Bloc<RecommendedPlacesBlocEvent, RecommendedPlacesBlocState> {
  RecommendedPlacesBlocBloc() : super(RecommendedPlacesBlocInitial()) {
    on<RecommendedPlacesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
