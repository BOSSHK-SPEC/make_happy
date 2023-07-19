import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final double elevation;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  const GradientElevatedButton({
    Key? key,
    required this.text,
    required this.gradient,
    this.elevation = 2.0,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: textStyle,
        ),
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
    );
  }
}
