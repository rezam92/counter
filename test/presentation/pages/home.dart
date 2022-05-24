import 'package:counter_test/domain/usecases/counter_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../domain/usecases/counter_usecase.mocks.dart';

void main() {
  const counter = 1;

  late MockCounterRepo mockRepository;
  late CounterUseCase usecase;

  setUp(() {
    mockRepository = MockCounterRepo();
    usecase = CounterUseCase(counterRepo: mockRepository);
  });

  testWidgets('Test counter button', (WidgetTester tester) async {
    when(mockRepository.readCounter()).thenAnswer((_) async => const Right(1));
    when(mockRepository.increment(counter)).thenAnswer((_) async => const Right(null));
    when(mockRepository.decrement(counter)).thenAnswer((_) async => const Right(null));

    int currentCount = 1;

    // test counter button
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              key: const Key('dec'),
                              child: const Text('-'),
                              onPressed: () async {
                                if ((await usecase.decrement(currentCount)).isRight()) {
                                  currentCount--;
                                }
                              },
                            ),
                          ),
                          Text(
                            '$currentCount',
                            key: const Key('counter'),
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              key: const Key('inc'),
                              child: const Text('+'),
                              onPressed: () async {
                                when(mockRepository.increment(counter)).thenAnswer((_) async => const Right(null));
                                if ((await usecase.increment(currentCount)).isRight()) {
                                  currentCount++;
                                }
                              },
                            ),
                          ),
                        ],
                      ).padding(horizontal: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //increment test
    expect(find.byKey(const Key('counter')), findsOneWidget);
    await tester.tap(find.byKey(const Key('inc')));
    await tester.pumpAndSettle();
    expect(currentCount, 2);

    //decrement test
    currentCount = 1;
    await tester.tap(find.byKey(const Key('dec')));
    await tester.pumpAndSettle();
    expect(currentCount, 0);
  });
}
