import 'package:counter_test/application/error/failure.dart';
import 'package:counter_test/domain/repos/counter_repo.dart';
import 'package:dartz/dartz.dart';

class CounterUseCase {
  final CounterRepo counterRepo;

  const CounterUseCase({
    required this.counterRepo,
  });

  Future<Either<Failure, int>> readCounter() async {
    return await counterRepo.readCounter();
  }

  Future<Either<Failure, void>> increment(int oldCCounter) async {
    return await counterRepo.increment(oldCCounter);
  }

  Future<Either<Failure, void>> decrement(int oldCCounter) async {
    return await counterRepo.decrement(oldCCounter);
  }
}
