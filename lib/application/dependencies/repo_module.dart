import 'package:counter_test/data/repos/counter_repo.dart';
import 'package:counter_test/data/services/db_services.dart';
import 'package:counter_test/domain/repos/counter_repo.dart';

class RepoModule {
  static CounterRepo? _counterRepo;
  static DBService dbService = DBService();

  static CounterRepo get getCounterRepo {
    _counterRepo ??= CounterRepoImpl(dbService);
    return _counterRepo!;
  }
}
