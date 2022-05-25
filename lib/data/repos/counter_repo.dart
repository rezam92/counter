import 'package:counter_test/application/error/failure.dart';
import 'package:counter_test/data/services/db_services.dart';
import 'package:counter_test/domain/repos/counter_repo.dart';
import 'package:dartz/dartz.dart';

class CounterRepoImpl extends CounterRepo {
  final DBService _dbService;

  CounterRepoImpl(this._dbService);

  @override
  Future<Either<Failure, void>> decrement(int oldCounter) async {
    try {
      if (await _dbService.decrement((--oldCounter))) {
        return const Right(null);
      } else {
        return Left(FailureOperation(errorReason: "Could not decrease"));
      }
    } catch (e) {
      return Left(FailureOperation(errorReason: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> increment(int oldCounter) async {
    try {
      if (await _dbService.increment((++oldCounter))) {
        return const Right(null);
      } else {
        return Left(FailureOperation(errorReason: "Could not increase"));
      }
    } catch (e) {
      return Left(FailureOperation(errorReason: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> readCounter() async {
    try {
      return Right(await _dbService.readCounter());
    } catch (e) {
      return Left(FailureOperation(errorReason: e.toString()));
    }
  }
}
