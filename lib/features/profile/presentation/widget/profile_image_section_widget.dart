import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_cached_network_image.dart';
import '../../../../core/common/app_components/app_svg_picture.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../generated/assets.gen.dart';
import '../../../authentication/data/models/user_model.dart';
import '../cubit/profile_detail_cubit.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
    required this.data,
    required this.state,
    required this.showPreview,
  });

  final UserModel data;
  final ProfileDetailState state;
  final bool showPreview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProfileDetailCubit>().selectProfilePicture();
      },
      child: Center(
        child: Column(
          children: [
            showPreview
                ? (state.images.isNotEmpty)
                    ? _ProfileImagePreview(
                        image: state.images.first,
                      )
                    : emptyWidget
                : _NetworkAvatar(imageUrl: data.picture),
            verticalMargin8,
            showPreview
                ? (state.images.isNotEmpty)
                    ? _RemoveImageIcon(
                        image: state.images.first,
                      )
                    : emptyWidget
                : _ChangePhotoText(),
          ],
        ),
      ),
    );
  }
}

class _ProfileImagePreview extends StatelessWidget {
  const _ProfileImagePreview({required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      image,
      height: 80.h,
      width: 80.w,
      fit: BoxFit.cover,
    );
  }
}

class _NetworkAvatar extends StatelessWidget {
  const _NetworkAvatar({this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage.avatar(
      imageUrl: imageUrl ?? '',
      height: 80.h,
      width: 80.w,
      fit: BoxFit.cover,
      alt: "U",
    );
  }
}

class _RemoveImageIcon extends StatelessWidget {
  const _RemoveImageIcon({required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture.icon(
      Assets.icon.close,
      backgroundColor: PrimitiveColors.purpleP60,
      color: PrimitiveColors.grayG500,
      onTap: () {
        context.read<ProfileDetailCubit>().removeProfilePicture();
      },
    );
  }
}

class _ChangePhotoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppText(
      "Change Photo",
      style: AllTextStyle.f14W5.copyWith(
        color: PrimitiveColors.grayG600,
      ),
    );
  }
}
