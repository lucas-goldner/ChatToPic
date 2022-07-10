import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/constants/ds_modal_constants.dart';
import 'package:chattopic/ui/shared/pixel_border.dart';
import 'package:flutter/material.dart';

class DSModal extends StatelessWidget {
  const DSModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
      ],
    );
  }
}
