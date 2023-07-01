import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/helper/extensions/color_extension.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/constants/ds_bar_constants.dart';
import 'package:chattopic/ui/painters/common_painters.dart';
import 'package:flutter/material.dart';

class DSTopBarBackgroundPainter extends CustomPainter {
  final FavoriteColor color;
  DSTopBarBackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Commonpainters commonpainters = Commonpainters();
    final paint = Paint()
      ..color = color.getColor()
      // Strokewidth = 1 causes the underlying canvas layer to blend with this one.
      ..strokeWidth = 2;
    final CanvasArgs canvasArgs = CanvasArgs(canvas, size, paint);

    for (double index = 0; index <= size.height; index++) {
      int intIndex = index.toInt();

      if (intIndex == DSBarConstants.sections.first.stop ||
          intIndex == DSBarConstants.sections[2].stop) {
        commonpainters.pixelizedRow(
          canvasArgs,
          color.getColor().lighten(
                intIndex == 0
                    ? DSBarConstants.sections.first.lightenValue
                    : DSBarConstants.sections[1].lightenValue,
              ),
          color.getColor().lighten(
                intIndex == 0
                    ? DSBarConstants.sections[1].lightenValue
                    : DSBarConstants.sections[2].lightenValue,
              ),
          intIndex.toDouble(),
        );
      } else if (intIndex == DSBarConstants.sections[5].stop) {
        commonpainters.pixelizedTripleRow(
          canvasArgs,
          color.getColor().lighten(DSBarConstants.sections[4].lightenValue),
          color.getColor().lighten(DSBarConstants.sections[5].lightenValue),
          intIndex.toDouble(),
        );
      } else {
        _paintBarTopRow(index, color.getColor(), canvasArgs);
      }
    }

    // Final border line.
    paint.color = Colors.black;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _paintBarTopRow(
    double index,
    Color color,
    CanvasArgs canvasArgs,
  ) {
    final postion1 = Offset(0, index);
    final postion2 = Offset(canvasArgs.size.width, index);
    final section4 = DSBarConstants.sections[4].stop;
    final section7 = DSBarConstants.sections[7].stop;

    if (index < DSBarConstants.sections[2].stop &&
        index >= DSBarConstants.sections[1].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[1].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < section4 && index > DSBarConstants.sections[3].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[3].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[5].stop && index > section4) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[4].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < section7 && index > DSBarConstants.sections[6].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[6].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[8].stop && index > section7) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[7].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < canvasArgs.size.height &&
        index > DSBarConstants.sections.last.stop) {
      canvasArgs.paint.color = color;
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    }
  }
}
