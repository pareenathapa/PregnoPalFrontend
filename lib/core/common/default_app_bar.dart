import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/size/app_size.dart';
import '../../config/routes/route_paths.dart';
import '../../config/routes/routes.gr.dart';
import '../../di/main_di.dart';
import '../../features/profile/presentation/cubit/profile_detail_cubit.dart';
import '../../generated/assets.gen.dart';
import '../service/navigation_service.dart';
import '../themes/text_theme/all_text_styles.dart';
import 'app_components/app_cached_network_image.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.showActions = true,
    this.actions,
    this.title,
  });

  final bool showActions;
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProfileDetailCubit>()..getProfileDetail(),
      child: AppBar(
        title: title != null
            ? Text(
                title!,
                style: AllTextStyle.f16W6,
              )
            : null,
        centerTitle: title != null,
        leadingWidth: 80.w,
        leading: Padding(
          padding: horizontalPadding16,
          child: Image.asset(
            Assets.images.pp.path,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              locator<NavigationService>().push(const NotificationScreen());
            },
            child: Icon(
              Icons.notifications_outlined,
              size: 28.h,
            ),
          ),
          horizontalMargin8,
          if (showActions) ...actions ?? <Widget>[],
          BlocBuilder<ProfileDetailCubit, ProfileDetailState>(
            builder: (context, state) {
              if (state.profileData != null) {
                return GestureDetector(
                  onTap: () {
                    locator<NavigationService>().pushNamed(
                      AppRoutePaths.profile(),
                    );
                  },
                  child: AppCachedNetworkImage.avatar(
                    width: 34.w,
                    height: 34.h,
                    imageUrl: state.userData!.picture,
                    alt: state.userData!.name,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          horizontalMargin8,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
