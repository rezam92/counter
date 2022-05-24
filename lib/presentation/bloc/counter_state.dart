part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterLoading extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterInitial extends CounterState {
  final int counter;

  CounterInitial({
    required this.counter,
  });

  CounterInitial copyWith({
    int? counter,
  }) {
    return CounterInitial(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [counter];
}

class CounterError extends CounterState {
  final String error;
  CounterError(this.error);

  @override
  List<Object?> get props => [];
}
