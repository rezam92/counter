part of 'tab_bar_cubit.dart';

@immutable
abstract class TabBarState extends Equatable {}

class TabBarInitial extends TabBarState {
  final int tabIndex;

  TabBarInitial(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];

  TabBarInitial copyWith({
    int? tabIndex,
  }) {
    return TabBarInitial(
      tabIndex ?? this.tabIndex,
    );
  }
}
