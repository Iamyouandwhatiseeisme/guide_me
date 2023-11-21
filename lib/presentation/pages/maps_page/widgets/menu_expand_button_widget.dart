import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

class MenuExpandButtonWidget extends StatelessWidget {
  const MenuExpandButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff292F32).withOpacity(0.75)),
      height: 36,
      width: 25,
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<IsExapndedCubit>(context).toggleExpansion();
        },
        child: const Icon(Icons.more_vert_outlined, color: Color(0xffF3F0E6)),
      ),
    );
  }
}
