import 'package:counter_test/presentation/bloc/counter_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class
CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) => Parent(
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
                    gesture: Gestures()..onTap(() => context.read<CounterCubit>().decrement()),
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
                    gesture: Gestures()..onTap(() => context.read<CounterCubit>().increment()),
                    child: const Text('+').fontSize(60.r).fontWeight(FontWeight.w300).textColor(Colors.white).padding(right: 15.w),
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
                child: state is CounterLoaded ? Text('${(state).counter}').fontSize(60.sp).textColor(Colors.deepPurple)
                    : CupertinoActivityIndicator(radius: 30.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
