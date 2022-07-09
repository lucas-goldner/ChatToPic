import 'package:chattopic/flavours/flavour_config.dart';
import 'package:chattopic/main.dart';
import 'package:chattopic/model/enum/environment.dart';
import 'package:flutter/material.dart';

void main() async {
  FlavourConfig.setEnvironment(Environment.prod);
  runApp(const Main());
}
