import 'package:chattopic/ui/shared/pixel_border.dart';
import 'package:flutter/material.dart';

const double _modalHeight = 140;
const double _modalWidth = 340;
const Radius _borderRaidus = Radius.circular(8.0);
const double _pixelSize = 2.0;

class DSModal extends StatelessWidget {
  const DSModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        shape: PixelBorder.solid(
          pixelSize: _pixelSize,
          borderRadius: const BorderRadius.all(_borderRaidus),
        ),
      ),
      height: _modalHeight,
      width: _modalWidth,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
