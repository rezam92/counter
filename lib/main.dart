import 'package:counter_test/application/app.dart';
import 'package:counter_test/application/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  await setup();
  runApp(const Application());
}
