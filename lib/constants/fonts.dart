import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  comp(
      {context,
      Color? color,
      double? fontSize,
      dynamic fontWeight,
      TextDecoration? textDecoration}) {
    return GoogleFonts.varelaRound(
      fontSize: fontSize ?? 23,
      fontWeight: fontWeight ?? FontWeight.w900,
      color: color ?? Colors.black,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }

  h1({context, Color? color, double? fontSize, dynamic fontWeight}) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w900,
      color: color ?? Colors.black,
    );
  }

  h2({
    context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.black,
      letterSpacing: spacing ?? 1,
    );
  }

  h3({context, Color? color, double? fontSize, dynamic fontWeight}) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  h4({context, Color? color, double? fontSize, dynamic fontWeight}) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  p({
    context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
      letterSpacing: spacing ?? 1,
    );
  }
}
