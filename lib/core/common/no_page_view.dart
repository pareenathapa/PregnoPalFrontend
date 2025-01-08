import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';
import '../themes/text_theme/all_text_styles.dart';
import 'app_components/app_text.dart';

// ! DO NOT MODIFY THIS FILE
class NoRoutePage extends StatelessWidget {
  const NoRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(''),
      ),
      body: Center(
        child: AppText(
          LocaleKeys.commonText_404Page,
          style: AllTextStyle.f20W8,
        ),
      ),
    );
  }
}
