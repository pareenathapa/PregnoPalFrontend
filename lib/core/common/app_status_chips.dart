import 'package:flutter/material.dart';

import '../../../config/constants/size/app_size.dart';
import '../../config/constants/colors/custom_app_color.dart';
import '../../config/constants/colors/primitive_colors_constants.dart';
import '../themes/text_theme/all_text_styles.dart';
import 'app_components/app_chips.dart';

enum StatusType {
  success,
  invite,
  process,
  reject,
  waiting,
}

/// A widget that displays a status chip with a label and customizable appearance.
///
/// The [StatusChips] widget is used to display a chip with a status label. The appearance
/// of the chip is determined by the status type, which is derived from the provided label.
/// The chip can have a gradient label and customizable padding.
///
/// The [StatusChips] widget requires a [label] to be provided, which is used to determine
/// the status type and the appearance of the chip. The [gradientLabel] parameter can be
/// used to enable or disable a gradient effect on the label. The [padding] parameter allows
/// customization of the padding around the chip.
///
/// Example usage:
/// ```dart
/// StatusChips(
///   label: 'success',
///   gradientLabel: true,
///   padding: EdgeInsets.all(8.0),
/// )
/// ```
///
/// See also:
/// - [AppChips], which is used to display the chip.
/// - [StatusType], which defines the possible status types.
class StatusChips extends StatelessWidget {
  final String label;
  final bool gradientLabel;
  final EdgeInsetsGeometry? padding;
  final CustomAppColor? backgroundColor;
  final CustomAppColor? labelColor;

  const StatusChips({
    super.key,
    required this.label,
    this.gradientLabel = false,
    this.padding,
    this.backgroundColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    final status = getStatusType(label.toLowerCase());
    final foreground = labelColor ?? _getLabelColor(status);
    final background = backgroundColor ?? _getStatusColor(status);

    return AppChips(
      label: label.replaceAll('-', ' '),
      translate: false,
      backgroundColor: background,
      labelStyle: AllTextStyle.f12W6.copyWith(
        color: foreground,
      ),
      shape: BoxShape.rectangle,
      padding: padding ?? horizontalPadding12 + verticalPadding6,
    );
  }
}

final successStatus = [
  'success',
  'completed',
  'complete',
];

final inviteStatus = [
  'invite',
  'invited',
  'accepted',
  'accept',
];

final processStatus = [
  'process',
  'processing',
  'review',
  'confirmed',
];

final rejectStatus = [
  'reject',
  'rejected',
];

final waitingStatus = [
  'waiting',
  'pending',
  'confirm',
  "confirmed",
];

CustomAppColor _getStatusColor(StatusType status) {
  switch (status) {
    case StatusType.success:
      return PrimitiveColors.statusLightGreen;
    case StatusType.invite:
      return PrimitiveColors.statusLightPurple;
    case StatusType.process:
      return PrimitiveColors.statusLightBlue;
    case StatusType.reject:
      return PrimitiveColors.statusLightRed;
    case StatusType.waiting:
      return PrimitiveColors.statusLightOrange;
    default:
      return PrimitiveColors.statusLightGreen;
  }
}

CustomAppColor _getLabelColor(StatusType status) {
  switch (status) {
    case StatusType.success:
      return PrimitiveColors.statusGreen;
    case StatusType.invite:
      return PrimitiveColors.statusPurple;
    case StatusType.process:
      return PrimitiveColors.statusBlue;
    case StatusType.reject:
      return PrimitiveColors.statusRed;
    case StatusType.waiting:
      return PrimitiveColors.statusOrange;
    default:
      return PrimitiveColors.statusGreen;
  }
}

StatusType getStatusType(String status) {
  if (successStatus.contains(status)) return StatusType.success;
  if (inviteStatus.contains(status)) return StatusType.invite;
  if (processStatus.contains(status)) return StatusType.process;
  if (rejectStatus.contains(status)) return StatusType.reject;
  if (waitingStatus.contains(status)) return StatusType.waiting;
  return StatusType.waiting;
}
