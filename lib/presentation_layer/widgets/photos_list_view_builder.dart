import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_layer/cubit/photos_by_place_id_fetcher_cubit.dart';

class PhotoListViewBuilder extends StatelessWidget {
  const PhotoListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosByPlaceIdFetcherCubit,
        PhotosByPlaceIdFetcherState>(builder: (context, photosState) {
      if (photosState is PhotosByPlaceIdFetcherLoaded) {
        return SizedBox(
          width: 430,
          height: 260,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photosState.photosByPlaceId.length,
              itemBuilder: (context, index) {
                return Stack(alignment: Alignment.bottomLeft, children: [
                  Container(
                    width: 430,
                    height: 260,
                    child: Image.network(
                      photosState.photosByPlaceId[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 41, bottom: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff292F32BF).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(32)),
                      width: 54,
                      height: 18,
                      child: Center(
                        child: Text(
                          '${index + 1}/${photosState.photosByPlaceId.length}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Color(0xffF3F0E6)),
                        ),
                      ),
                    ),
                  ),
                ]);
              }),
        );
      } else if (photosState is PhotosByPlaceIdFetcherLoading) {
        return const CircularProgressIndicator();
      } else if (photosState is PhotosByPlaceIdFetcherInitial) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Container(child: const Text('NO PHOTOS'));
      }
    });
  }
}
