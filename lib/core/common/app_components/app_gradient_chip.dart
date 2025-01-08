import 'package:flutter/material.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';

class GradientTextChip extends StatelessWidget {
  final String label;
  final List<Color> gradientColors;
  final double fontSize;

  const GradientTextChip({
    super.key,
    required this.label,
    this.gradientColors = const [
      Color(0xFF1AABEC), // #1AABEC
      Color(0xFF5957D5), // #5957D5
      Color(0xFFC43FAB), // #C43FAB
      Color(0xFFEE4A65), // #EE4A65
      Color(0xFFF87741), // #F87741
    ],
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: _buildGradientText(label),
      backgroundColor: PrimitiveColors
          .purpleP20, // You can change this to your desired background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    );
  }

  /// Build the gradient text using ShaderMask.
  Widget _buildGradientText(String text) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        stops: const [0, 0.27, 0.56, 0.79, 1], // Adjust the stops as needed
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          color: Colors
              .white, // Use white as a placeholder; actual color comes from gradient
          fontSize: fontSize,
          fontWeight: FontWeight.w600, // Adjust the weight as needed
        ),
      ),
    );
  }
}
