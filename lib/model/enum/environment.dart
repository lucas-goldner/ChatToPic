import 'package:flutter/material.dart';

enum Environment {
  dev,
  prod,
}

extension FlavourTypeExtension on Environment {
  Color? getFlavourColor() {
    switch (this) {
      case Environment.dev:
        return Colors.yellow[800]!;
      case Environment.prod:
        return Colors.grey[600];
      default:
        return Colors.blue[600]!;
    }
  }

  String getFlavourName() {
    switch (this) {
      case Environment.dev:
        return 'Development';
      case Environment.prod:
        return 'Production';
      default:
        return 'Unknown';
    }
  }
}
