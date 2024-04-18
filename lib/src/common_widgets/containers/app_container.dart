import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/utils/constants.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.betweenTilePadding,
    this.margin,
    this.width,
    this.onTap,
    this.height,
    this.constraints,
    this.border,
    this.color,
    this.borderRadius = Constant.kBorderRadius,
    this.boxShape = BoxShape.rectangle,
    this.isElevated = false,
    this.gradient,
    this.image,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? betweenTilePadding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final BoxConstraints? constraints;
  final BoxBorder? border;
  final Color? color;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;
  final bool isElevated;
  final Gradient? gradient;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: betweenTilePadding ?? EdgeInsets.zero,
      child: Material(
        borderRadius: borderRadius,
        color: color,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Container(
            constraints: constraints,
            width: width,
            height: height,
            padding: padding,
            margin: margin,
            decoration: isElevated
                ? BoxDecoration(
                    image: image,
                    color: color,
                    borderRadius:
                        boxShape == BoxShape.circle ? null : borderRadius,
                    shape: boxShape,
                    border: border,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    gradient: gradient,
                  )
                : BoxDecoration(
                    color: color,
                    image: image,
                    border: border,
                    borderRadius:
                        boxShape == BoxShape.circle ? null : borderRadius,
                    shape: boxShape,
                    gradient: gradient,
                  ),
            child: child,
          ),
        ),
      ),
    );
  }
}
