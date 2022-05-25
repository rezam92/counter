import 'package:counter_test/domain/usecases/counter_usecase.dart';
import 'package:counter_test/presentation/bloc/counter_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/counter_usecase.mocks.dart';

void main() {
  late MockCounterRepo mockRepository; // = MockCustomerRepo();
  late CounterUseCase usecase;
  late CounterCubit cubit;

  const counter = 1;

  setUp(() {
    mockRepository = MockCounterRepo();
    when(mockRepository.readCounter()).thenAnswer((_) async => const Right(counter));
    when(mockRepository.increment(counter)).thenAnswer((_) async => const Right(null));
    when(mockRepository.decrement(counter)).thenAnswer((_) async => const Right(null));
    usecase = CounterUseCase(counterRepo: mockRepository);
    cubit = CounterCubit(usecase);
  });

  test(('init state'), () {
    expect(cubit.state, equals(CounterLoaded(counter: counter)));
  });

  test(('inc state'), () async {
    await cubit.increment();
    expect(cubit.state, equals(CounterLoaded(counter: counter + 1)));
  });

  test(('dec state'), () async {
    await cubit.decrement();
    expect(cubit.state, equals(CounterLoaded(counter: counter - 1)));
  });
}
