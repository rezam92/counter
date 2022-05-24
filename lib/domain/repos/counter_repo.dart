import 'package:counter_test/application/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepo {
  Future<Either<Failure, int>> readCounter();
  Future<Either<Failure, void>> increment(int oldCounter);
  Future<Either<Failure, void>> decrement(int oldCounter);
}
