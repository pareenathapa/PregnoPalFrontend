import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: PrimitiveColors.primary,
          ),
        );
      },
    );
  }
}
