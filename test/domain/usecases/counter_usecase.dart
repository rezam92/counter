import 'package:counter_test/domain/repos/counter_repo.dart';
import 'package:counter_test/domain/usecases/counter_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_usecase.mocks.dart';

@GenerateMocks([CounterRepo])
void main() {
  late CounterUseCase usecase;
  late MockCounterRepo mockRepository;

  setUp(() {
    mockRepository = MockCounterRepo();
    usecase = CounterUseCase(counterRepo: mockRepository);
  });

  test(
    'should read the counter value',
    () async {
      const counter = 1;

      // arrange
      when(mockRepository.readCounter()).thenAnswer((_) async => const Right(counter));

      // act
      final result = await usecase.readCounter();

      // assert
      expect(result, const Right(counter));
      if (result.isRight()) {
        var value = result.toOption().toNullable();
        if (value != null) {
          expect(value, counter);
        }
      }
      verify(mockRepository.readCounter());
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'test increment',
    () async {
      const counter = 1;

      // arrange
      when(mockRepository.readCounter()).thenAnswer((_) async => const Right(counter));
      when(mockRepository.increment(counter)).thenAnswer((realInvocation) async=> const Right(null));

      // act
      final result = await usecase.readCounter();

      // assert
      expect(result, const Right(counter));
      if (result.isRight()) {
        var value = result.toOption().toNullable();
        if (value != null) {
          expect(value, counter);
          var incResult = await usecase.increment(value);
          expect(incResult, const Right(null));
        }
      }
      verify(mockRepository.increment(counter));
      verify(mockRepository.readCounter());
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'test decrement',
        () async {
      const counter = 1;

      // arrange
      when(mockRepository.readCounter()).thenAnswer((_) async => const Right(counter));
      when(mockRepository.decrement(counter)).thenAnswer((realInvocation) async=> const Right(null));

      // act
      final result = await usecase.readCounter();

      // assert
      expect(result, const Right(counter));
      if (result.isRight()) {
        var value = result.toOption().toNullable();
        if (value != null) {
          expect(value, counter);
          var incResult = await usecase.decrement(value);
          expect(incResult, const Right(null));
        }
      }
      verify(mockRepository.decrement(counter));
      verify(mockRepository.readCounter());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
