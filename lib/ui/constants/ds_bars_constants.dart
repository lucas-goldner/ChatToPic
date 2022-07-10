import 'package:chattopic/model/ds_bar_section.dart';

class DSBarConstants {
  static const double barHeight = 88;

  static final List<DSBarSection> sections = [
    DSBarSection(0, 80),
    DSBarSection(8, 70),
    DSBarSection(16, 60),
    DSBarSection(24, 50),
    DSBarSection(32, 40),
    DSBarSection(44, 30),
    DSBarSection(52, 20),
    DSBarSection(60, 10),
    DSBarSection(68, 0),
  ];
}
