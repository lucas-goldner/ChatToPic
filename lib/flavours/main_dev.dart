import 'package:chattopic/flavours/flavour_config.dart';
import 'package:chattopic/main.dart';
import 'package:chattopic/model/enum/environment.dart';
import 'package:flutter/material.dart';

void main() async {
  Constants.setEnvironment(Environment.dev);
  runApp(const MyApp());
}
