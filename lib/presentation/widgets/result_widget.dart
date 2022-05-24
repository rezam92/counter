import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class ResultWidget extends StatelessWidget {
  final int counter;
  const ResultWidget({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Result is").textColor(Colors.white).fontSize(18.sp),
        SizedBox(height: 15.h),
        Parent(
          style: ParentStyle()
            ..borderRadius(all: 150.h)
            ..width(120.w)
            ..height(120.w)
            ..background.color(Colors.white)
            ..alignmentContent.center(),
          child: Text('$counter').fontSize(60.sp).textColor(Colors.deepPurple),
        ),
      ],
    );
  }
}
