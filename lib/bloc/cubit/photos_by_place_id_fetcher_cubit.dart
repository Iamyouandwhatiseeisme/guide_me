import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';

part 'photos_by_place_id_fetcher_state.dart';

class PhotosByPlaceIdFetcherCubit extends Cubit<PhotosByPlaceIdFetcherState> {
  PhotosByPlaceIdFetcherCubit() : super(PhotosByPlaceIdFetcherInitial());
  bool photosFetched = false;
  final googleDataSource = sl.get<GoogleDataSource>();
  void fetchPhotos({
    required String placeId,
  }) async {
    try {
      if (!photosFetched) {
        emit(PhotosByPlaceIdFetcherLoading());
        final fetchedPhotosByPlaceId = await googleDataSource.fetChPhotosHelper(
          listOfPhotos: [],
          placeId: placeId,
        );

        if (isClosed) {
          return;
        }

        emit(PhotosByPlaceIdFetcherLoaded(fetchedPhotosByPlaceId));
        photosFetched = true;
      }
    } catch (error) {
      // Handle the error here
      emit(PhotosByPlaceIdFetcherError(
          errorMessage: 'Failed to fetch nearby places: $error'));
    }
  }
}
