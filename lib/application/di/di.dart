import 'package:counter_test/data/services/storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

Future setup() async {
  getIt.registerSingletonAsync<ILocalStorage>(() async {
    var ls = LocalStorage();
    await ls.initialize();
    return ls;
  });
}
