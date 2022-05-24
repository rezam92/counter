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
    emit(res.fold((l) => CounterError((l as FailureOperation).errorReason), (r) => CounterInitial(counter: r)));
  }

  Future decrement() async {
    var res = await useCase.increment((state as CounterInitial).counter);
    if (res.isRight()) {
      emit(CounterInitial(counter: (state as CounterInitial).counter - 1));
    } else {
      emit(res.fold(
        (l) => CounterError((l as FailureOperation).errorReason),
        (r) => CounterInitial(counter: ((state as CounterInitial).counter - 1)),
      ));
      emit((state as CounterInitial).copyWith());
    }
  }

  Future increment() async {
    var res = await useCase.increment((state as CounterInitial).counter);
    if (res.isRight()) {
      emit(CounterInitial(counter: (state as CounterInitial).counter + 1));
    } else {
      emit(res.fold(
        (l) => CounterError((l as FailureOperation).errorReason),
        (r) => CounterInitial(counter: ((state as CounterInitial).counter + 1)),
      ));
      emit((state as CounterInitial).copyWith());
    }
  }
}
