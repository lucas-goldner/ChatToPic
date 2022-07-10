import 'package:flutter/material.dart';

// Used for common properties that need to be passed
// between functions.

class CanvasArgs {
  Canvas canvas;
  Size size;
  Paint paint;

  CanvasArgs(this.canvas, this.size, this.paint);
}
