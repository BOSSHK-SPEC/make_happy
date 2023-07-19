import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class style {
  static TextStyle small(BuildContext context, {Color? color}) {
    return GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle medium(BuildContext context, {Color? color}) {
    return GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle large(BuildContext context, {Color? color}) {
    return GoogleFonts.openSans(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
    );
  }
}