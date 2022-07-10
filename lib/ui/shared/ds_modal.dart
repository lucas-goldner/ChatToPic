import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/constants/ds_modal_constants.dart';
import 'package:chattopic/ui/shared/pixel_border.dart';
import 'package:flutter/material.dart';

class DSModal extends StatelessWidget {
  final String text;
  const DSModal(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomPaint(
            painter: DSModalBackgroundPainter(),
            size: const Size(
              DSModalConstants.orangeWidth,
              DSModalConstants.orangeHeight,
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: ShapeDecoration(
              shape: PixelBorder.solid(
                pixelSize: DSModalConstants.pixelSize,
                borderRadius:
                    const BorderRadius.all(DSModalConstants.borderRaidus),
              ),
            ),
            height: DSModalConstants.modalHeight,
            width: DSModalConstants.modalWidth,
          ),
        ),
        Center(
          child: Container(
            decoration: ShapeDecoration(
              shape: PixelBorder.solid(
                color: ChatToPicColors.dsModalOutlineColor,
                pixelSize: DSModalConstants.pixelSize,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
            ),
            height: DSModalConstants.orangeHeight,
            width: DSModalConstants.orangeWidth,
          ),
        ),
        Center(
          child: Container(
            decoration: ShapeDecoration(
              shape: PixelBorder.solid(
                pixelSize: DSModalConstants.smallerPixelSize,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            ),
            height: DSModalConstants.smallestHeight,
            width: DSModalConstants.smallestWidth,
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class DSModalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ScaleFactor is used to scale the background to the whole screen.

    int two = 2;
    final paint = Paint()
      ..color = ChatToPicColors.dsGreyBackground
      ..strokeWidth = 1;

    for (double index = 0; index <= size.height; index++) {
      final postion1 = Offset(0, index);
      final postion2 = Offset(size.width, index);
      paint.color = index % two == 0
          ? ChatToPicColors.dsModalBackgroundColor
          : Colors.black;

      canvas.drawLine(postion1, postion2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
