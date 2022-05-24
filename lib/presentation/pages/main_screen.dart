import 'package:counter_test/application/dependencies/repo_module.dart';
import 'package:counter_test/domain/usecases/counter_usecase.dart';
import 'package:counter_test/presentation/bloc/counter_cubit.dart';
import 'package:counter_test/presentation/bloc/tab_bar_cubit.dart';
import 'package:counter_test/presentation/pages/home.dart';
import 'package:counter_test/presentation/pages/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  static const screens = [
    HomeScreen(),
    ResultScreen(),
  ];

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, TabBarState>(
      builder: (context, state) {
        return BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(CounterUseCase(counterRepo: RepoModule.getCounterRepo)),
          child: buildBottom(context, state as TabBarInitial),
        );
      },
    );
  }

  Widget buildBottom(BuildContext context, TabBarInitial state) {
    return Scaffold(
      body: Center(
        child: screens.elementAt(state.tabIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: ScreenUtil().setHeight(60),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11.sp,
          unselectedFontSize: 10.sp,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey[400],
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 20.r),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_paperclip, size: 20.r),
              label: 'Result',
              backgroundColor: Colors.white,
            ),
          ],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: state.tabIndex,
          selectedItemColor: Colors.purple[600],
          unselectedItemColor: Colors.grey[600],
          onTap: (index) => context.read<TabBarCubit>().changeTabBarIndex(index),
        ),
      ),
    );
  }
}
