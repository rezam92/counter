import 'package:counter_test/application/error/failure.dart';
import 'package:counter_test/domain/usecases/counter_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.useCase) : super(CounterLoading()) {
    readCounter();
  }

  final CounterUseCase useCase;

  Future readCounter() async {
    emit(CounterLoading());
    var res = await useCase.readCounter();
    emit(res.fold<CounterState>(
      (l) => CounterError((l as FailureOperation).errorReason),
      (r) => CounterLoaded(counter: r),
    ));
  }

  Future decrement() async {
    if (state is CounterLoading) return;
    var preState = state as CounterLoaded;
    emit(CounterLoading());
    try {
      var res = await useCase.decrement(preState.counter);
      if (res.isRight()) {
        emit(CounterLoaded(counter: preState.counter - 1));
      } else {
        emit(res.fold(
          (l) => CounterError((l as FailureOperation).errorReason),
          (r) => CounterLoaded(counter: (preState.counter - 1)),
        ));
      }
    } catch (e) {
      CounterError(e.toString());
    }
  }

  Future increment() async {
    if (state is CounterLoading) return;
    var preState = state as CounterLoaded;
    emit(CounterLoading());
    try {
      var res = await useCase.increment(preState.counter);
      if (res.isRight()) {
        emit(CounterLoaded(counter: preState.counter + 1));
      } else {
        emit(res.fold(
          (l) => CounterError((l as FailureOperation).errorReason),
          (r) => CounterLoaded(counter: (preState.counter + 1)),
        ));
      }
    } catch (e) {
      CounterError(e.toString());
    }
  }
}
