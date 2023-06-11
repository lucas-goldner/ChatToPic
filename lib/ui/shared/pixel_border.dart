// Code copied and modified by myself
// from https://github.com/aqulu/flutter_pixel_border/edit/main/lib/pixel_border.dart
// since package is outdated and I need to modify it for my purpose

import 'dart:math';

import 'package:flutter/widgets.dart';

///
/// A ShapeBorder to draw a box with pixelated corners.
///
class PixelBorder extends OutlinedBorder {
  /// The radii for each corner.
  ///
  /// Each corner [Radius] defines the endpoints that will be connected by
  /// "pixels" (squares) with size [pixelSize].
  ///
  /// For the border to be drawn properly, each radius must be a multiple of
  /// [pixelSize]
  final BorderRadiusGeometry borderRadius;

  /// size of a "pixel"
  /// the smaller, the less pixelated the shape will look
  final double pixelSize;

  const PixelBorder._(
    this.borderRadius,
    this.pixelSize,
    BorderSide side,
  ) : super(side: side);

  /// Creates a PixelBorder shape without rendering its border.
  const PixelBorder.shape({
    required this.borderRadius,
    required this.pixelSize,
  }) : super();

  /// Creates a PixelBorder which will be rendered with [color].
  /// The width of the border equals [pixelSize]
  PixelBorder.solid({
    required BorderRadius borderRadius,
    required double pixelSize,
    Color color = const Color(0xFF000000),
  }) : this._(
          borderRadius,
          pixelSize,
          BorderSide(color: color, width: pixelSize),
        );

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => _getPath(
        borderRadius.resolve(textDirection).toRRect(rect).deflate(side.width),
      );

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _getPath(borderRadius.resolve(textDirection).toRRect(rect));

  double getRadius(Radius radius, RRect rrect) {
    final maxRadius = max(0.0, max(radius.y, radius.x));
    final side = min(rrect.height, rrect.width);
    const half = 2;

    return (min(side / half - pixelSize, maxRadius) ~/ pixelSize) * pixelSize;
  }

  Path _getPath(RRect rrect) {
    assert(borderRadius % pixelSize == BorderRadius.zero);

    // check if radii are larger than half of respective side
    // adjust radius if necessary, so side is at least 2 * [pixelSize]

    final tlRadius = getRadius(rrect.tlRadius, rrect);
    final trRadius = getRadius(rrect.trRadius, rrect);
    final blRadius = getRadius(rrect.blRadius, rrect);
    final brRadius = getRadius(rrect.brRadius, rrect);
    final rrectCenterY = rrect.center.dy;
    final rrectCenterX = rrect.center.dx;

    final tlYStart = min(rrectCenterY, rrect.top + tlRadius);
    final tlXEnd = min(rrectCenterX, rrect.left + tlRadius);

    final trXStart = max(rrectCenterX, rrect.right - trRadius);
    final trYEnd = min(rrectCenterY, rrect.top + trRadius);

    final brYStart = max(rrectCenterY, rrect.bottom - brRadius);
    final brXEnd = max(rrectCenterX, rrect.right - brRadius);

    final blXStart = min(rrectCenterX, rrect.left + blRadius);
    final blYEnd = max(rrectCenterY, rrect.bottom - blRadius);

    final List<Offset> vertices = [
      Offset(rrect.left, tlYStart),

      // Top left corner.
      for (double index = pixelSize;
          index <= tlXEnd - rrect.left;
          index += pixelSize) ...[
        Offset(rrect.left + index, tlYStart - index + pixelSize),
        Offset(rrect.left + index, tlYStart - index),
      ],

      // Top line.
      Offset(trXStart, rrect.top),

      // Top right corner.
      for (double index = pixelSize;
          index <= trYEnd - rrect.top;
          index += pixelSize) ...[
        Offset(trXStart + index - pixelSize, rrect.top + index),
        Offset(trXStart + index, rrect.top + index),
      ],

      // Right line.
      Offset(rrect.right, brYStart),

      // Bottom right corner.
      for (double index = pixelSize;
          index <= rrect.right - brXEnd;
          index += pixelSize) ...[
        Offset(rrect.right - index, brYStart + index - pixelSize),
        Offset(rrect.right - index, brYStart + index),
      ],

      // Bottom line.
      Offset(blXStart, rrect.bottom),

      // Bottom left corner.
      for (double index = pixelSize;
          index <= rrect.bottom - blYEnd;
          index += pixelSize) ...[
        Offset(blXStart - index + pixelSize, rrect.bottom - index),
        Offset(blXStart - index, rrect.bottom - index),
      ],
    ];

    return Path()..addPolygon(vertices, true);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty || side.style == BorderStyle.none) return;

    final Path path = getOuterPath(rect, textDirection: textDirection)
      ..addPath(getInnerPath(rect), Offset.zero);
    final paint = Paint()
      ..color = side.color
      ..strokeWidth = pixelSize
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) =>
      PixelBorder._(borderRadius * t, pixelSize * t, side.scale(t));

  @override
  PixelBorder copyWith({BorderSide? side, BorderRadius? borderRadius}) =>
      PixelBorder._(
        borderRadius ?? this.borderRadius,
        pixelSize,
        side ?? this.side,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PixelBorder &&
          pixelSize == other.pixelSize &&
          borderRadius == other.borderRadius &&
          side == other.side;

  @override
  int get hashCode => Object.hash(pixelSize, borderRadius);
}
