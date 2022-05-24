import 'package:counter_test/application/di/di.dart';
import 'package:counter_test/data/services/storage.dart';

class DBService {
  Future<bool> writeCounter(int counter) async {
    var locator = getIt.get<ILocalStorage>();
    return await locator.write<int>('counter', counter);
  }

  Future<int> readCounter() async {
    var locator = getIt.get<ILocalStorage>();
    return ((await locator.read<int?>('counter')) ?? 0);
  }
}
