import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// A custom `StatelessWidget` that displays text with optional translation support.
///
/// The `AppText` widget wraps a `Text` widget and provides additional functionality
/// such as localization support using the `easy_localization` package.
///
/// ## Parameters:
///
/// - `data` (required): The text to display.
/// - `style`: The style to use for the text.
/// - `textAlign`: How the text should be aligned horizontally.
/// - `maxLines`: An optional maximum number of lines for the text to span.
/// - `overflow`: How visual overflow should be handled.
/// - `translate`: Whether the text should be translated using `easy_localization`. Defaults to `true`.
///
/// ## Example:
///
/// ```dart
/// AppText(
///   'hello_world',
///   style: AllTextStyle.f16W6,
///   textAlign: TextAlign.center,
///   maxLines: 2,
///   overflow: TextOverflow.ellipsis,
///   translate: true,
/// )
/// ```
///
/// In the example above, the text 'hello_world' will be translated using the `easy_localization` package
/// and displayed with the specified style, alignment, and overflow behavior.

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool translate;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.translate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      translate ? data.tr() : data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
