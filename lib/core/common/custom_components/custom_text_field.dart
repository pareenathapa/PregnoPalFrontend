import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../../generated/assets.gen.dart';
import '../../themes/text_theme/all_text_styles.dart';
import '../app_components/app_svg_picture.dart';
import '../app_components/app_text.dart';

class KTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? errorTextStyle;
  final bool? enableIMEPersonalizedLearning;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onSuffixTap;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? readOnly;
  final int? maxLength;
  final bool isPasswordField;
  final BorderRadius? borderRadius;
  final bool? noBorder;
  final EdgeInsetsGeometry? contentPadding;

  const KTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.titleText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.contentStyle,
    this.titleStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.errorTextStyle,
    this.enableIMEPersonalizedLearning = true,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.inputFormatters,
    this.focusNode,
    this.textAlign,
    this.maxLines = 1,
    this.readOnly,
    this.maxLength,
    this.borderRadius,
    this.isPasswordField =
        false, // Added flag to check if this is a password field
    this.noBorder = false,
    this.contentPadding,
  });

  @override
  State<KTextFormField> createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  bool _isObscured = true; // Initial state for password visibility

  final textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: widget.titleText?.isEmpty == false
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        widget.titleText?.isEmpty == false
            ? AppText(
                widget.titleText ?? "",
                style: widget.titleStyle ?? AllTextStyle.f14W5,
              )
            : const SizedBox.shrink(),
        if (widget.titleText?.isEmpty == false) verticalMargin4,
        TextFormField(
          readOnly: widget.readOnly ?? false,
          controller: widget.controller,
          textAlign: widget.textAlign ?? TextAlign.start,
          keyboardType: widget.keyboardType,
          obscuringCharacter: '●',
          obscureText: widget.isPasswordField
              ? _isObscured
              : widget.obscureText ?? false,
          inputFormatters: widget.inputFormatters,
          enableSuggestions: widget.enableSuggestions ?? true,
          autocorrect: widget.autocorrect ?? true,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enableIMEPersonalizedLearning:
              widget.enableIMEPersonalizedLearning ?? true,
          style: widget.contentStyle ?? AllTextStyle.f14W5,
          focusNode: widget.focusNode ?? textFocus,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            counterText: '',
            errorMaxLines: 1,
            fillColor: widget.fillColor,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle,
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            hintTextDirection: TextDirection.ltr,
            suffixIcon: widget.isPasswordField
                ? GestureDetector(
                    onTap: _toggleObscureText,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      width: 10.w,
                      child: AppSvgPicture.fromAsset(
                        _isObscured ? Assets.icon.eyeOff : Assets.icon.eye,
                        height: 10.h,
                        color: PrimitiveColors.additionalIcons,
                      ),
                    ),

                    // Icon(
                    //   _isObscured ? Icons.visibility_off : Icons.visibility,
                    // ),
                  )
                : widget.suffixIcon != null
                    ? GestureDetector(
                        onTap: widget.onSuffixTap,
                        child: widget.suffixIcon,
                      )
                    : null,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.darkGrayD200, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.darkGrayD200, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.primary, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.additionalRed, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.additionalRed, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.noBorder == true
                    ? PrimitiveColors.transparent
                    : PrimitiveColors.darkGrayD200, // Set the border color
              ),
              borderRadius:
                  widget.borderRadius ?? allRadius8, // Set the border radius
            ),
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          onTapOutside: (details) {
            textFocus.unfocus();
          },
        ),
      ],
    );
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
