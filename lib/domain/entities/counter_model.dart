import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'counter_model.g.dart';

@HiveType(typeId: 0)
class CounterModel extends Equatable {
  @HiveField(0)
  final int counter;

  const CounterModel({
    required this.counter,
  });

  @override
  List<Object?> get props => [counter];
}
