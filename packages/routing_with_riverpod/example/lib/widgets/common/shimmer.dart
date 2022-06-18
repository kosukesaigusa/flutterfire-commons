import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Shimmer の楕円形や長方形の要素ウィジェット
class ShimmerWidget extends StatelessWidget {
  /// 楕円形
  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        borderRadius = null,
        shape = BoxShape.circle;

  /// 長方形
  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    Color? baseColor,
    Color? highlightColor,
  })  : baseColor = baseColor ?? _baseColor,
        highlightColor = highlightColor ?? _highlightColor,
        shape = BoxShape.rectangle;

  static const _baseColor = Colors.black26;
  static const _highlightColor = Colors.black12;

  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final BoxShape shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: borderRadius == null ? null : BorderRadius.circular(borderRadius!),
            shape: shape,
          ),
        ),
      );
}
