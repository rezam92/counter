import 'package:counter_test/domain/entities/counter_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ILocalStorage {
  Future<void> initialize();

  Future<bool> write<T>(String key, T value);

  Future<dynamic> read<T>(key);
}

class LocalStorage implements ILocalStorage {
  late Box _box;

  Box get box => _box;

  @override
  Future<void> initialize() async {
    try {
      await Hive.initFlutter();
    } catch (e) {
      // log locally, server
    }

    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(CounterModelAdapter());

    try {
      _box = await Hive.openBox('counterTest');
    } catch (e) {
      // log locally, server
    }
  }

  @override
  Future<bool> write<T>(String key, T value) async {
    try {
      await _box.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<dynamic> read<T>(key) async {
    return (await _box.get(key)) as T;
  }
}
