import 'package:counter_test/presentation/bloc/counter_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
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
              child: state is CounterLoaded ? Text('${state.counter}').fontSize(60.sp).textColor(Colors.deepPurple) : CupertinoActivityIndicator(radius: 30.sp),
            ),
          ],
        );
      },
    );
  }
}
