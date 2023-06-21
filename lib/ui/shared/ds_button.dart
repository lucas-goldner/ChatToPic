import 'package:chattopic/ui/constants/chat_to_pic_text_styles.dart';
import 'package:chattopic/ui/painters/ds_button_painter.dart';
import 'package:flutter/material.dart';

class DSButton extends StatelessWidget {
  const DSButton({
    super.key,
    required this.title,
    required this.letter,
    this.callback,
    double? optionalButtonXOffset,
    double? optionalTitleOffset,
  }) : buttonXOffset = optionalButtonXOffset ?? 36;

  final String title;
  final String letter;
  final Size size = const Size(120, 32);
  final int _bounds = 4;
  final VoidCallback? callback;
  final double buttonXOffset;

  double getLetterOffset() => buttonXOffset - 2.5;
  double getTitleOffset() => buttonXOffset + 20;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => callback?.call(),
        child: Container(
          width: size.width + _bounds,
          height: size.height + _bounds,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: Colors.black.withOpacity(0.5), width: 2),
            ),
          ),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                CustomPaint(
                  size: size,
                  painter:
                      DSButtonPainter(optionalButtonXOffset: buttonXOffset),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getTitleOffset(), top: 4),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: fontSize16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getLetterOffset(), top: 9.5),
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
