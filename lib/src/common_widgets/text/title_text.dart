import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textDecoration,
    this.fontSize,
    this.textAlign,
    this.overflow,
    this.fontWeight = FontWeight.w600,
    this.lineHeight,
    this.fontStyle = FontStyle.normal,
  });

  final String text;
  final Color? color;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final double? lineHeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: fontWeight,
            decoration: textDecoration,
            fontSize: fontSize,
            height: lineHeight,
            fontStyle: fontStyle,
          ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
