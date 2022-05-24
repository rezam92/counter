import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  final Function increment;
  final Function decrement;

  const CounterWidget({
    Key? key,
    required this.counter,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Parent(
      style: ParentStyle()
        ..width(size.width)
        ..height(120.h)
        ..background.color(const Color(0xff844cff))
        ..borderRadius(all: 120.h)
        ..margin(horizontal: 50.w),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Parent(
                  style: ParentStyle()
                    ..height(120.h)
                    ..borderRadius(all: 120.h)
                    ..alignmentContent.centerLeft(),
                  gesture: Gestures()..onTap(() => decrement()),
                  child: const Text('-').fontSize(60.sp).fontWeight(FontWeight.w300).textColor(Colors.white).padding(left: 15.w),
                ),
              ),
              Expanded(
                flex: 1,
                child: Parent(
                  style: ParentStyle()
                    ..height(120.h)
                    ..borderRadius(all: 120.h)
                    ..alignmentContent.centerRight(),
                  gesture: Gestures()..onTap(() => increment()),
                  child: const Text('+').fontSize(60.sp).fontWeight(FontWeight.w300).textColor(Colors.white).padding(right: 15.w),
                ),
              ),
            ],
          ),
          Positioned(
            child: Parent(
                style: ParentStyle()
                  ..height(120.h)
                  ..width(120.h)
                  ..margin(all: 2)
                  ..borderRadius(all: 120.h)
                  ..alignmentContent.center()
                  ..boxShadow(color: Colors.black.withOpacity(0.15), blur: 5, spread: 1)
                  ..background.color(Colors.white),
                child: Text('$counter').fontSize(60.sp).textColor(Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
