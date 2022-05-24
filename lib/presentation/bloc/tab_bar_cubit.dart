import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(TabBarInitial(0));

  TabBarCubit._privateConstructor() : super(TabBarInitial(0));

  static final TabBarCubit _instance = TabBarCubit._privateConstructor();

  static TabBarCubit get I => _instance;

  void changeTabBarIndex(int newIndex) {
    emit(TabBarInitial(newIndex));
  }
}
