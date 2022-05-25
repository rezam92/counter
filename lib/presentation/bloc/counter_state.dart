part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterLoading extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterLoaded extends CounterState {
  final int counter;

  CounterLoaded({
    required this.counter,
  });

  CounterLoaded copyWith({
    int? counter,
  }) {
    return CounterLoaded(
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
