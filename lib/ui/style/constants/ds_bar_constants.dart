import 'package:chattopic/model/ds_bar_section.dart';

class DSBarConstants {
  static const double barHeight = 88;
  // Every original ds pixel is represented by 8 px.
  static final List<DSBarSection> sections = [
    DSBarSection(0, 80),
    DSBarSection(8, 70),
    DSBarSection(16, 60),
    DSBarSection(24, 50),
    DSBarSection(32, 40),
    DSBarSection(44, 30),
    DSBarSection(56, 20),
    DSBarSection(64, 10),
    DSBarSection(72, 0),
  ];

  static final List<DSBarSection> reversedSections = [
    DSBarSection(2, 0),
    DSBarSection(26, 10),
    DSBarSection(34, 20),
    DSBarSection(42, 30),
    DSBarSection(42, 40),
    DSBarSection(50, 40),
    DSBarSection(54, 40),
    DSBarSection(62, 40),
    DSBarSection(70, 50),
    DSBarSection(70, 60),
    DSBarSection(80, 60),
    DSBarSection(80, 70),
  ];
}
