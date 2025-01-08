import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_svg_picture.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../di/main_di.dart';
import '../../../../generated/assets.gen.dart';
import '../cubit/profile_detail_cubit.dart';

class ProfileChildrenSectionWidget extends StatefulWidget {
  const ProfileChildrenSectionWidget({super.key});

  @override
  State<ProfileChildrenSectionWidget> createState() =>
      _ProfileChildrenSectionWidgetState();
}

class _ProfileChildrenSectionWidgetState
    extends State<ProfileChildrenSectionWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController dateOfBirthController = TextEditingController();

  final TextEditingController sexController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> onAdd() async {
    if (formKey.currentState!.validate()) {
      await context.read<ProfileDetailCubit>().addChild(
            name: nameController.text,
            dateOfBirth: dateOfBirthController.text,
            height: double.parse(heightController.text),
            sex: sexController.text,
            weight: double.parse(weightController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDetailCubit, ProfileDetailState>(
      listener: (context, state) {
        if (state.addChildSuccess) {
          context.showSnackBar(
            message: "Child added successfully",
          );
          locator<NavigationService>().maybePopTop();
        }
        if (state.error != null) {
          context.showSnackBar(
            message: state.error!.message,
            isError: true,
          );
          locator<NavigationService>().maybePopTop();
        }
      },
      builder: (context, state) {
        if (state.profileData!.children.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Children",
                    style: AllTextStyle.f18W6.copyWith(
                      color: PrimitiveColors.dark,
                    ),
                  ),
                  AppSvgPicture.icon(
                    Assets.icon.plus,
                    containerHeight: 24,
                    containerWidth: 24,
                    color: PrimitiveColors.dark,
                    containerPadding: allPadding2,
                    backgroundColor: PrimitiveColors.grayG30,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => AddChildBottomSheetWidget(
                          nameController: nameController,
                          dateOfBirthController: dateOfBirthController,
                          sexController: sexController,
                          heightController: heightController,
                          weightController: weightController,
                          formKey: formKey,
                          onAdd: onAdd,
                        ),
                      );
                    },
                  ),
                ],
              ),
              verticalMargin16,
              SizedBox(
                height: 110.h,
                width: 1.sw,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) {
                    final age = DateTime.now().year -
                        DateTime.parse(
                          state.profileData!.children[i].dateOfBirth,
                        ).year;
                    return Container(
                      width: 0.7.sw,
                      decoration: BoxDecoration(
                        color: PrimitiveColors.grayG30,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: horizontalPadding16 + verticalPadding16,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                state.profileData!.children[i].name,
                                style: AllTextStyle.f16W6.copyWith(
                                  color: PrimitiveColors.dark,
                                ),
                              ),
                              verticalMargin4,
                              AppText(
                                "Age: $age",
                                style: AllTextStyle.f14W4.copyWith(
                                  color: PrimitiveColors.secondaryDark,
                                ),
                              ),
                              verticalMargin4,
                              Row(
                                children: [
                                  AppText(
                                    "Height: ${state.profileData!.children[i].height} cm",
                                    style: AllTextStyle.f14W4.copyWith(
                                      color: PrimitiveColors.secondaryDark,
                                    ),
                                  ),
                                  horizontalMargin16,
                                  AppText(
                                    "Weight: ${state.profileData!.children[i].weight} kg",
                                    style: AllTextStyle.f14W4.copyWith(
                                      color: PrimitiveColors.secondaryDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (c, i) {
                    return horizontalMargin12;
                  },
                  itemCount: state.profileData!.children.length,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              AppSvgPicture.fromAsset(
                Assets.icon.emptyListIcon,
                width: 100,
                height: 100,
              ),
              verticalMargin6,
              AppText(
                "No children added yet",
                style: AllTextStyle.f16W6.copyWith(
                  color: PrimitiveColors.dark,
                ),
              ),
              verticalMargin6,
              AppText(
                "Add your child to get started",
                style: AllTextStyle.f14W4.copyWith(
                  color: PrimitiveColors.secondaryDark,
                ),
              ),
              verticalMargin16,
              AppButton.secondary(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddChildBottomSheetWidget(
                      nameController: nameController,
                      dateOfBirthController: dateOfBirthController,
                      sexController: sexController,
                      heightController: heightController,
                      weightController: weightController,
                      formKey: formKey,
                      onAdd: onAdd,
                    ),
                  );
                },
                label: "Add a child",
              ),
            ],
          );
        }
      },
    );
  }
}

class AddChildBottomSheetWidget extends StatelessWidget {
  const AddChildBottomSheetWidget({
    super.key,
    required this.nameController,
    required this.dateOfBirthController,
    required this.sexController,
    required this.heightController,
    required this.weightController,
    required this.formKey,
    required this.onAdd,
  });

  final TextEditingController nameController;
  final TextEditingController dateOfBirthController;
  final TextEditingController sexController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final GlobalKey<FormState> formKey;
  final Future<void> Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PrimitiveColors.white,
        borderRadius: verticalTopRadius16,
      ),
      height: 0.7.sh,
      padding: horizontalPadding16 + verticalPadding16,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppText(
              "Add a child",
              style: AllTextStyle.f16W6.copyWith(
                color: PrimitiveColors.dark,
              ),
            ),
            verticalMargin16,
            KTextFormField(
              controller: nameController,
              hintText: "Child's name",
              titleText: "Name",
              validator: (p0) {
                final result = p0!.validateName(
                  fieldName: "Name",
                );
                return result.fold(
                  (l) => l,
                  (r) => null,
                );
              },
            ),
            verticalMargin16,
            KTextFormField(
              controller: dateOfBirthController,
              hintText: "Date of birth",
              titleText: "DOB",
              readOnly: true,
              validator: (p0) {
                final result = p0!.validateNotEmpty(
                  "Date of birth",
                );
                return result.fold(
                  (l) => l,
                  (r) => null,
                );
              },
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateOfBirthController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),
            ),
            verticalMargin16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Sex",
                  style: AllTextStyle.f14W5,
                ),
                verticalMargin4,
                DropdownButtonFormField<String>(
                  onChanged: (String? newValue) {
                    sexController.text = newValue!;
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            verticalMargin16,
            KTextFormField(
              validator: (p0) {
                final result = p0!.validateNotEmpty(
                  "Height",
                );
                return result.fold(
                  (l) => l,
                  (r) => null,
                );
              },
              controller: heightController,
              hintText: "Height (cm)",
              titleText: "Height",
              keyboardType: TextInputType.number,
            ),
            verticalMargin16,
            KTextFormField(
              validator: (p0) {
                final result = p0!.validateNotEmpty(
                  "Weight",
                );
                return result.fold(
                  (l) => l,
                  (r) => null,
                );
              },
              controller: weightController,
              hintText: "Weight (kg)",
              titleText: "Weight",
              keyboardType: TextInputType.number,
            ),
            verticalMargin16,
            AppButton.secondary(
              onPressed: () async {
                await onAdd();
              },
              label: "Add Child",
            ),
            verticalMargin16,
          ],
        ),
      ),
    );
  }
}
