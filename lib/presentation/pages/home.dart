import 'package:counter_test/presentation/bloc/counter_cubit.dart';
import 'package:counter_test/presentation/widgets/counter_widget.dart';
import 'package:counter_test/presentation/widgets/error_widget.dart';
import 'package:counter_test/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[400],
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (ctx, state) => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is CounterInitial)
                      CounterWidget(
                        counter: state.counter,
                        increment: () => context.read<CounterCubit>().increment(),
                        decrement: () => context.read<CounterCubit>().decrement(),
                      ),
                    if (state is CounterLoading) const LoadingIndicator(),
                    if (state is CounterError)
                      ErrorWidgets(
                        error: state.error,
                        retry: () => context.read<CounterCubit>().readCounter(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
