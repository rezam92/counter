import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class ErrorWidgets extends StatelessWidget {
  final Function retry;
  final String error;
  const ErrorWidgets({Key? key, required this.error, required this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle(),
      gesture: Gestures()..onTap(() async => retry()),
      child: Text('$error. Tap to Load Again').fontSize(16.sp),
    );
  }
}
