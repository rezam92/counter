import 'package:counter_test/application/di/di.dart';
import 'package:counter_test/presentation/bloc/tab_bar_cubit.dart';
import 'package:counter_test/presentation/pages/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.landscape ? const Size(812, 375) : const Size(375, 812),
        builder: (ctx, child) => MaterialApp(
          title: 'Flutter Counter Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: FutureBuilder(
            future: getIt.allReady(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return BlocProvider<TabBarCubit>.value(
                  value: TabBarCubit.I,
                  child: const MainScreen(),
                );
              }
              return Scaffold(
                backgroundColor: Colors.deepPurpleAccent[400],
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Counter App').textColor(Colors.white).fontSize(32.sp),
                      ],
                    ).padding(bottom: 25),
                    CupertinoActivityIndicator(radius: 20.r, color: Colors.white),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
