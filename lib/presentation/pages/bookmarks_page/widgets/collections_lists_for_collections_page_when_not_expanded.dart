import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/data/data.dart';

import '../../../../bloc/cubit/is_exapnded_cubit.dart';

class CollectionsListForCollectionsPage extends StatelessWidget {
  const CollectionsListForCollectionsPage({
    super.key,
    this.color,
    required this.listOfCollections,
    required this.index,
    required this.icon,
  });
  final Color? color;
  final Icon icon;
  final int index;
  final List<CollectionModel> listOfCollections;

  @override
  Widget build(BuildContext context) {
    final isExpanded = BlocProvider.of<IsExapndedCubit>(context);
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listOfCollections[index].name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff292F32)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                        '${listOfCollections[index].items.length} ${AppLocalizations.of(context)!.items}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff292F32)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () => isExpanded.toggleExpansion(),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.25)),
                    child: icon,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 0.5,
            decoration:
                BoxDecoration(color: const Color(0xff292F32).withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
